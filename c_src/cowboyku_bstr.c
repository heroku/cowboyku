#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#include "erl_nif.h"

static ERL_NIF_TERM capitalize_token(ErlNifEnv* env, int argc,
                                     const ERL_NIF_TERM argv[]) {
    ErlNifBinary bin, bin_out;

    if (!enif_inspect_binary(env, argv[0], &bin) ||
        !enif_alloc_binary(bin.size, &bin_out)) {
        return enif_make_badarg(env);
    }

    bool start = true;

    for (int i = 0; i < bin.size; i++) {
        char in = bin.data[i];
        if (start == true &&
            in >= 'a' &&
            in <= 'z') {
            start = false;
            bin_out.data[i] = in - 32;
        } else if (start == false &&
                   in >= 'A' &&
                   in <= 'Z') {
            bin_out.data[i] = in + 32;
        } else {
            if (in == '-') {
                start = true;
            }
            bin_out.data[i] = in;
        }
    }

    return enif_make_binary(env, &bin_out);
}

static ErlNifFunc nif_funcs[] =
{
    {"capitalize_token", 1, capitalize_token}
};

ERL_NIF_INIT(cowboyku_bstr,nif_funcs,NULL,NULL,NULL,NULL)

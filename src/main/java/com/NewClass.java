/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.stream.Stream;

/**
 *
 * @author teacher
 */
public class NewClass {

    public static void main(String[] args) {
        System.out.println(
        Stream.iterate(new long[]{1, 1}, f -> new long[]{f[1], f[0] + f[1]})
                .limit(31)
                .reduce((a, b) -> b)
                .get()[0]
        );
    }
}

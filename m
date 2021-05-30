Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F61C47092
	for <linux-usb@archiver.kernel.org>; Sun, 30 May 2021 12:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E60161107
	for <linux-usb@archiver.kernel.org>; Sun, 30 May 2021 12:23:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhE3MZ2 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 30 May 2021 08:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3MZ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 May 2021 08:25:28 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19564C061574
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 05:23:49 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id t17so1563233ljk.7
        for <linux-usb@vger.kernel.org>; Sun, 30 May 2021 05:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=pyvbG2ODT3sq3herWKKGlPIFMp/+oUFeqgY25LWyaTg=;
        b=fRY9aUQmW7QnprpdunW1z1/u9/IXiD4C3Ie8omXUtdjwG38PwxYGkyEEzVcdIgF8m9
         P2PQSnSwhMpuSDWCSKOJ1bT62Pm6snlqE3W5Wi3fWcfpB5TfoqtaQvWj+XfGjRGUqLN0
         loQm2a5vWOOwz91g9IiuIw6/qmfoHAz05mK/wvhKZHXL5FsrJ0AiRKNpfP4pU+Ev1jMV
         rsFIq4tfgilgfwF17nUo/rZHEXB7X5gNE4AkSw1bXoDRrvs53AIXiEvkbBlLiwGhMFQH
         xz3LKh+gtQMVyZaWES8A6fo1AFvi+ir88OBsWLvIXg9Qqxycsn3GNtezaz/0/ieE2iVd
         lizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pyvbG2ODT3sq3herWKKGlPIFMp/+oUFeqgY25LWyaTg=;
        b=T/JQqs/M2wYfBqxRUEGAdqIFr/+ubWLu6MoLCJ53+GHvEvpWgsjjLZ8iOnRQmKJfpe
         7LuR7E7jknWITsNKrb+/4G+aFr4CyAtajSFoX9veJXEszLpF50FxSz7Z8400TTlgv1hV
         FhN7avJ0SlKxOdp6hUViDgSfKdswg/cQyOgGQPS5Du1hebZD2EcLIk5Qybjz3jdWkbaw
         riqNhKD9L5UN30sxqdfzg+DsA9LlweaGe1PV//yrBLh2p5aov6wGJ/q6jkJuEZFM+RVi
         BaYJbwk6OPorvesgKp0PFMX9eUGaav8FAMuCy67ZILPknbFyiluuKgVwW+oRvTvLM8FQ
         M00Q==
X-Gm-Message-State: AOAM530t+vcSOn3Ykoq2o1q7WnMmWeFE2HZ9MvKucxQ2djXGZHXoUx4V
        QSQiOb/YuEeJcWtvG/Eq3tzWPmii2tykmsk6xuAli9WgQ0sib1on
X-Google-Smtp-Source: ABdhPJzUlleVW95toY0vdlejDNHQrfsbzodSrZMIUhQUW6/zO1WLzJaLaJzqGaYPXfPAu/TSeWkGeHGQlxK/WRhvSBY=
X-Received: by 2002:a05:651c:b07:: with SMTP id b7mr13160412ljr.218.1622377427292;
 Sun, 30 May 2021 05:23:47 -0700 (PDT)
MIME-Version: 1.0
From:   Eero Lehtinen <debiangamer2@gmail.com>
Date:   Sun, 30 May 2021 15:23:36 +0300
Message-ID: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I tested Johans latest patch and my dvb-t stick can find the channel
list but not to tune to them. It uses the mxl5005s driver again with
repeating mxl5005s I2C write failed messages:

[   23.276076] mxl5005s I2C reset failed
[   23.296082] mxl5005s I2C write failed
[   23.316041] mxl5005s I2C write failed
[   23.336061] mxl5005s I2C write failed
[   23.336100] usb 1-1: Frontend requested software zigzag, but didn't
set the frequency step size
[   23.356096] mxl5005s I2C reset failed
[   23.376226] mxl5005s I2C write failed
[   23.396084] mxl5005s I2C write failed
[   23.416082] mxl5005s I2C write failed

Return-Path: <linux-usb-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E8EC71148
	for <linux-usb@archiver.kernel.org>; Fri, 18 Aug 2023 09:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358902AbjHRJCZ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 18 Aug 2023 05:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358930AbjHRJCB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Aug 2023 05:02:01 -0400
X-Greylist: delayed 1506 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 02:01:39 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34D73C2D
        for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 02:01:39 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id B9FAA84071; Fri, 18 Aug 2023 09:16:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346566; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=cbBuM5eVIZHiaCyamHpL6plVoVn4AWNlJnFDxMkjdtW43cWeK0lcuPXCtXbF4i58j
         EWQZI0zL8ZofCX4fIZG2ak+LEjFGoPX0EQf+M4M+HxqRaR1gHBhipECA7mfea4tHy7
         ZLuGwIh0ErGeZnO1EfLpnsxTpt+jP2x5CWSkBzueBH+2cf9RQHpyAKPrFCv5/CVQ6D
         p+MXAJyjYQd4ad24aALDh/TjHHDQ421zpgad1hxx8kQWRhIyY5aocaQEa99eZMt0l7
         FB8PF5rpx9rDY6N9JOFNehTJHKVII0afozANZLysDq0g/8I6uBosL/WEdqU6wclrpO
         3gMIFDr7WG2Fw==
Received: by mail.leachkin.pl for <linux-usb@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.ctu1.0.10clk950cb@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-usb@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak

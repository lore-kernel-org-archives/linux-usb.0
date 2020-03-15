Return-Path: <SRS0=mFup=5A=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B99C10DCE
	for <linux-usb@archiver.kernel.org>; Sun, 15 Mar 2020 19:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C3BE20578
	for <linux-usb@archiver.kernel.org>; Sun, 15 Mar 2020 19:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=seas-upenn-edu.20150623.gappssmtp.com header.i=@seas-upenn-edu.20150623.gappssmtp.com header.b="o7jj0mEI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbgCOTAB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 15 Mar 2020 15:00:01 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40259 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728608AbgCOTAA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 15:00:00 -0400
Received: by mail-ot1-f66.google.com with SMTP id h17so15554019otn.7
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2020 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seas-upenn-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=wCkTWFAlc5zCtC35QGbN3xHCLK1mee0GuB9QSdWqKKU=;
        b=o7jj0mEIJ8Y20gy799W5idaoY/66LiQGp/0uMoUvjt3BP21cZU2n2Pq38VqJsyToZN
         cf8mfqvst1uHy5uYRg51bptMk1nU3gPKb278nnGlx4CcoFJhtnYkRxQnK+F6dD7Zkj8q
         SLELxpjyuMzqiDCod5PUudKF6FVxW7lI9ZQzPdrBxQSPcQND+GObhu7OjMn/mqssUA1D
         Om/mFujniQMr4eIdfhsb2m8khB3PYryTwjCa/nIJfwlLC+dCa+ASwb8H3yj+k3NYuabK
         nV0oKopqh4611gH1UisYkyQIThS0i1CSd6x6VwKpcGEpwC+4HeHamhi048YkPYUB1AZB
         IN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=wCkTWFAlc5zCtC35QGbN3xHCLK1mee0GuB9QSdWqKKU=;
        b=bHOoxX6m8snNbK9QGKPG3E2nN8/nNeam+sWHfdnWdHIefMkys/zb6k9XjvS5WJeedx
         rTDwrBN54zJbXN83Cqu9iSUhF0quRT4Hl03Jmb9gu133LYqE6Q5Xsy2BBcuz3YH5ZCzj
         +ZF/y/TTiH6tQbK22dtYd6cVgeknk9xUTE7wqECQ/IS+v2fX2yzRJ3j9lrDGHnHw/lrW
         +4tZJambHAM2wzRuNQo2jXuyk9go4oNpmn1Gi4djuOR8uQKaujj5dTtL74vlCcObyeVc
         UKldeFzyuRxSF5M1dV3YJqLN6w2jWelpO73E1ygr5IamPAbuHeo6xoHsuQXkUg+XFqSt
         Hohg==
X-Gm-Message-State: ANhLgQ1kTqVuB3+VmGlzAsucvVAZokObHgvgWCEDEtbdBXwnUcaqcR0v
        3xvMFV28bbZ5+6F0hTBduJnz3O97vX5MOA==
X-Google-Smtp-Source: ADFU+vsZKrn8uYAevKvAwiYFVEgwxiQmfTDz5D0kTLbNf81yn+Oqh8nT+MyJbInL6fWnLLpBuA90Bg==
X-Received: by 2002:a9d:6446:: with SMTP id m6mr18933439otl.122.1584298799658;
        Sun, 15 Mar 2020 11:59:59 -0700 (PDT)
Received: from evX1 ([189.172.49.121])
        by smtp.gmail.com with ESMTPSA id q6sm2162110otm.13.2020.03.15.11.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2020 11:59:59 -0700 (PDT)
Date:   Sun, 15 Mar 2020 12:59:56 -0600
From:   Enrique Vargas <jevargas@seas.upenn.edu>
To:     Helen Koike <helen.koike@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/2] Staging: media: rkisp1: trim diagram in comments to 80
 chars
Message-ID: <cover.1584298430.git.jevargas@seas.upenn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

*** BLURB HERE ***

Enrique Vargas (2):
  reduce comments width bellow 80 chars
  eliminate trailing whitespaces on comments

 drivers/staging/media/rkisp1/rkisp1-dev.c | 54 ++++++++++++++++-------
 1 file changed, 37 insertions(+), 17 deletions(-)

-- 
2.17.1


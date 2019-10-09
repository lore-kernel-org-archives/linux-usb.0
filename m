Return-Path: <SRS0=ivde=YC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26F0ECE58C
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 17:09:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78C3F218AC
	for <linux-usb@archiver.kernel.org>; Wed,  9 Oct 2019 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570640986;
	bh=NvkyV9kbuFWuk/Deg5Yy9k8lkgQuy+X7Z0RPD98Nkxg=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=kMdU253nkVAZRPEr+ESzOEejMf9nTvIv8Vr8Plbd/VwtkDqEibtbaz+CMklbJxVEH
	 o2/+Ry1khvKBDj31mAOkSH/ofiebyTrLvicl6M16ubdLZXntF0hUl9FnPbfaWW53oP
	 VTHRvsNQhTowZZ1Fzgui//rf6GTdGURUyzc0zuDI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731539AbfJIRJq (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 9 Oct 2019 13:09:46 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:38629 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIRJp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Oct 2019 13:09:45 -0400
Received: by mail-lf1-f53.google.com with SMTP id u28so2229912lfc.5
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2019 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8RjB4kSGsPzycVtiusiMlRNLiCPX2UbjkRPjp7C9ds=;
        b=T8Fu3psuMqsmzIBfCoZTSwNJTHcQA6K2BRWXgnPH+bdnNpg9wvICqT9FC9P2+2ns25
         GcO1Osbf8zoXV0+tWcOE0XWt2IN/y3IwEneDLBjM1whQrf4oy0pE7IAw15zV0fENR2iR
         VlBRBCIh8raZl9mhwtMkW+4ZqlcAaL5Ep9xYhOhHksAATy3gxKnJL1ZQwnwGYS5enAs7
         d9uFO2ihVD+YC0rGpxy4zA+TiiIqjv+xaGENYw+5uOWyTFuEsQgRFUaXBEfHWEY0xhfR
         N3lG3k6ZRgd4v8e6I4JJ+kHVqKI1gMGtm9BY7J3d2N/3lWBUZn0ou14f3Mpc9al2772p
         fANA==
X-Gm-Message-State: APjAAAVw+amp/jyOR/aMnyMo/lXNa1d9CpvzmOVUYkrvFWPi6+V9wn4P
        z6ni9xoX1/Ur9tP15y1Y+MpKoVPy
X-Google-Smtp-Source: APXvYqw7ZSLremA08Ezc+6GwgosZqsGrUD1jNZhucKq5ASLOm8niZ8T802+tMA2yG0Ax+Q0f320BXA==
X-Received: by 2002:a19:f018:: with SMTP id p24mr2828582lfc.51.1570640983749;
        Wed, 09 Oct 2019 10:09:43 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id r75sm627089lff.7.2019.10.09.10.09.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 10:09:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@xi.terra>)
        id 1iIFTE-0007pn-6Z; Wed, 09 Oct 2019 19:09:52 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] USB: usb-skeleton: regression fix
Date:   Wed,  9 Oct 2019 19:09:41 +0200
Message-Id: <20191009170944.30057-1-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I messed up when submitting the runtime PM fixes last week and failed to
notice that the change to usb-skeleton depended on another fix I already
had in my tree (I did notice the conflict, but rebased and sent a v2
also without the prerequisite patch).

So here's a regression fix to a commit in usb-linus for usb-skeleton. :/

Included are also a use-after-free fix and a related clean up.

Johan


Johan Hovold (3):
  USB: usb-skeleton: fix NULL-deref on disconnect
  USB: usb-skeleton: fix use-after-free after driver unbind
  USB: usb-skeleton: drop redundant in-urb check

 drivers/usb/usb-skeleton.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.23.0


Return-Path: <SRS0=NA4g=AT=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1D6C433DF
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jul 2020 13:07:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3FD820786
	for <linux-usb@archiver.kernel.org>; Wed,  8 Jul 2020 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594213637;
	bh=nsy9WcJxSjbXq8wFBmmgvXgY8rpEPxETaWu/T4jdGtM=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=YLgNEQ8jf8fvmWXBKYRyBHcgaMwag9scm+Tc/SlIwiPr3i5xg4KSEiDIsemXqDbmN
	 GSv9VO9S0uWdCgGHKP1I47t9hd8pOWSLFW7QM+0A2fh1snWhL1Ydlnaii0jBQCAUwC
	 IZm+lKuRp8njVUapYHF3+ceqxaGQXiKBYWRhEZag=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729133AbgGHNHQ (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 8 Jul 2020 09:07:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38751 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbgGHNHQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jul 2020 09:07:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id 9so54119483ljv.5
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2020 06:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=qS3odsWec48dFtazz69JP5j9S7cwbZpN/VzwMraFQCw=;
        b=lFCAFwloqfSBekUYNTyMilRyHqUtM5laHHyOJeXnp+XRYfzTJCSTQw7liDcyyRtUSU
         R9HgNnbX/qGJRNQ1UmOML3S1cQVu71ApaYmThnP5cmUQY2ouNx9tJ96sAquOsQa7MXgJ
         yfNDwo1UZy8ix5NNNVt7U5++qK7yOaTuRUTGirKvP2mGMP5VqhaBm2q20A1iNiqnyxMc
         penp847irTIERorGlxQ1YWum8qkTsVllyIbxL/cTCkhO7JB2A8mu5uJMJi2+6yUrdvmU
         t9w97JNf8JzvfYKtRpN//5iz2nnInF0MPaMLzlK4wMok524GfgKgn9y23+S4cgrxokTZ
         SoeQ==
X-Gm-Message-State: AOAM532lySLyfA1tZIl8XktCVue3dMbtSc1KHjKf/+B5k//K60RG11q/
        1Rkw+PpwxrRNt2Ju0ELNQ+g=
X-Google-Smtp-Source: ABdhPJyzaQm92EFUQ4QzEYf9lHqCBR7oWVx6AGjdsFxQOLFYhD2rKm77iQAFclnZxQ0GSzH7Z+Qugw==
X-Received: by 2002:a05:651c:1117:: with SMTP id d23mr34785350ljo.277.1594213633812;
        Wed, 08 Jul 2020 06:07:13 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id u5sm13407276lfm.81.2020.07.08.06.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 06:07:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jt9n4-0006c6-MY; Wed, 08 Jul 2020 15:07:10 +0200
Date:   Wed, 8 Jul 2020 15:07:10 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.8-rc5
Message-ID: <20200708130710.GA25398@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.8-rc5

for you to fetch changes up to da6902e5b6dbca9081e3d377f9802d4fd0c5ea59:

  USB: serial: option: add Quectel EG95 LTE modem (2020-07-07 17:40:52 +0200)

----------------------------------------------------------------
USB-serial fixes for 5.8-rc5

Here are some new device ids for 5.8.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
AceLan Kao (1):
      USB: serial: option: add Quectel EG95 LTE modem

Igor Moura (1):
      USB: serial: ch341: add new Product ID for CH340

James Hilliard (1):
      USB: serial: cypress_m8: enable Simply Automated UPB PIM

Jörgen Storvist (1):
      USB: serial: option: add GosunCn GM500 series

 drivers/usb/serial/ch341.c      | 1 +
 drivers/usb/serial/cypress_m8.c | 2 ++
 drivers/usb/serial/cypress_m8.h | 3 +++
 drivers/usb/serial/option.c     | 6 ++++++
 4 files changed, 12 insertions(+)

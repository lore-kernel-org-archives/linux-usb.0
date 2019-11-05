Return-Path: <SRS0=HTkx=Y5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65C1C49EAA
	for <linux-usb@archiver.kernel.org>; Tue,  5 Nov 2019 08:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAC3B2084D
	for <linux-usb@archiver.kernel.org>; Tue,  5 Nov 2019 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1572944096;
	bh=ov1nc7eCk+Ctq93l4fLsXP09miAHFw/qmyg3KoGhZ7s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=n76ye9ZS1DtXijYinh9CIgdVCN1C+xjY01s/V9gC34XgulFMc26xK/kj3vh1AdtHc
	 6vDQFLjOJz4gg/1nqC4g3d/hjhCphmp1Pzi16JvOp+biqBHFrKw2YsMzKSYqFaUnzi
	 2zK/X4Y2dv/hVTkxplDvCvdcWdfUvuNVty1paBT4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730596AbfKEIy4 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 5 Nov 2019 03:54:56 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39903 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730573AbfKEIyz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 03:54:55 -0500
Received: by mail-lf1-f67.google.com with SMTP id 195so14449915lfj.6
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 00:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4afoqspkcc5RK9XOk5fmMpLRXrhOEIrMZ5sEh9PN/9Y=;
        b=YyD/07VVYLCToxmXrkPnWcNVGfFoZUrf1sJfcy2fsn0/U8Aumeo884gyNnpnifa8Bv
         ZyGX0OH6eTu0/q01GiXsqYMNSfRqe2hWH/Q2JLuYkwIlBPQwJnQvl5BRsWVYqtdI3czY
         UrBjL/qJi/5AAOxSRmCdCoh4tKLN/TfImUdRZpSvABRRn1rzzaNfhJG6NVGu9lxVnsB9
         4jMeAT5h3cF6vB0IAaB09K0MZEcMA3by0xn7OYGTFtNS4jk8VrBJIuhepYr/Zuwpip9H
         C0DZ6TdwqVkgdjNsx1jAKzDW5EoEq2fJicxAas2omGMAm4BW5RYnrJuPbohJUIQUeDam
         N2Bw==
X-Gm-Message-State: APjAAAXRULijT16F8pDSLQDOb2CjalPNmg8aLW2EyTwGzE/ThRR3npSz
        nhIe+jKv4ckmAdDoti8NrI8=
X-Google-Smtp-Source: APXvYqy5inEdoGPeJOoHkLb9eiBFVdXaJe6OPaBXWVAVFc7Y8Q1DejKXrD6QVsGByN96uWPmc6NrQQ==
X-Received: by 2002:ac2:4989:: with SMTP id f9mr1706265lfl.42.1572944093536;
        Tue, 05 Nov 2019 00:54:53 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id f3sm2342885lfp.0.2019.11.05.00.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 00:54:52 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@xi.terra>)
        id 1iRuPm-0004HX-Cr; Tue, 05 Nov 2019 09:42:14 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Juergen Stuber <starblue@users.sourceforge.net>,
        legousb-devel@lists.sourceforge.net, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 13/14] USB: legousbtower: drop superfluous brackets
Date:   Tue,  5 Nov 2019 09:41:51 +0100
Message-Id: <20191105084152.16322-14-johan@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191105084152.16322-1-johan@kernel.org>
References: <20191105084152.16322-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop superfluous brackets around single-line blocks.

Also add missing white space around operators in a for-expression being
modified.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/misc/legousbtower.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index 6f34b3802332..6b7ea80d5876 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -481,12 +481,10 @@ static __poll_t tower_poll(struct file *file, poll_table *wait)
 	poll_wait(file, &dev->write_wait, wait);
 
 	tower_check_for_read_packet(dev);
-	if (dev->read_packet_length > 0) {
+	if (dev->read_packet_length > 0)
 		mask |= EPOLLIN | EPOLLRDNORM;
-	}
-	if (!dev->interrupt_out_busy) {
+	if (!dev->interrupt_out_busy)
 		mask |= EPOLLOUT | EPOLLWRNORM;
-	}
 
 	return mask;
 }
@@ -532,9 +530,8 @@ static ssize_t tower_read(struct file *file, char __user *buffer, size_t count,
 		goto unlock_exit;
 	}
 
-	if (read_timeout) {
+	if (read_timeout)
 		timeout = jiffies + msecs_to_jiffies(read_timeout);
-	}
 
 	/* wait for data */
 	tower_check_for_read_packet(dev);
@@ -544,9 +541,8 @@ static ssize_t tower_read(struct file *file, char __user *buffer, size_t count,
 			goto unlock_exit;
 		}
 		retval = wait_event_interruptible_timeout(dev->read_wait, dev->interrupt_in_done, dev->packet_timeout_jiffies);
-		if (retval < 0) {
+		if (retval < 0)
 			goto unlock_exit;
-		}
 
 		/* reset read timeout during read or write activity */
 		if (read_timeout
@@ -572,9 +568,8 @@ static ssize_t tower_read(struct file *file, char __user *buffer, size_t count,
 	spin_lock_irq(&dev->read_buffer_lock);
 	dev->read_buffer_length -= bytes_to_read;
 	dev->read_packet_length -= bytes_to_read;
-	for (i=0; i<dev->read_buffer_length; i++) {
+	for (i = 0; i < dev->read_buffer_length; i++)
 		dev->read_buffer[i] = dev->read_buffer[i+bytes_to_read];
-	}
 	spin_unlock_irq(&dev->read_buffer_lock);
 
 	retval = bytes_to_read;
@@ -625,9 +620,8 @@ static ssize_t tower_write(struct file *file, const char __user *buffer, size_t
 		}
 		retval = wait_event_interruptible(dev->write_wait,
 						  !dev->interrupt_out_busy);
-		if (retval) {
+		if (retval)
 			goto unlock_exit;
-		}
 	}
 
 	/* write the data into interrupt_out_buffer from userspace */
-- 
2.23.0


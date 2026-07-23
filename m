Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC236E46C
	for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 19:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784836630; cv=none; b=NnAApzi61kzpELFdJJM9cn6xemsOMYMoF0G9OHrgAu1chIm5grwIHRk/JmamKdiGDpn1xAMwW2Y7knwznHGngUtouFcAjtOckVdC8x6JNlxS5OEnK4Z4396Ep6RVU59cVSvNKLKLZHrflh19ZUavwm0nZikF0Isb3BC3wJGXMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784836630; c=relaxed/simple;
	bh=EWe+ZqkjDRS2J3Dw0dcCnxct+Xf9tTUPjzOKougrOX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JHWX8j/oh7uic4feUVYYpuH7qctB6LkLhmE3hPbtApDAgTMQ6Z0dvUDwjKZcupaunJQQAjVc+Ui3OIwAUc5aL924x5LxuTLSLUJ7loaNg5gPXLiTl5Hik7N36VDUZdJ67e3IDK972fTbm6okvdeplyFtDL39yaUO+QZG5+eWOXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvJaLk4+; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvJaLk4+"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e6128bd9b3so504135a34.1
        for <linux-usb@vger.kernel.org>; Thu, 23 Jul 2026 12:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784836628; x=1785441428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMq/+2eblzzeE6AMRwMGsvfqnhpd6dQiBsU4+qwl+f4=;
        b=mvJaLk4+txg3dzSQSmfCf5/p1vrQ1XiCA2I0tvPdGVUyeSY//UWPfRzc4YhW7aIiiO
         tL8fssfYEdT+ioSSo45BfTnX1tJFALvf0mmlpxxSighf+xrjzrN8pEounqY4fwD8CH8C
         ctsS07dk1+Ho0DhN4uWldNwkvbrs8qXjFClt0ePtmVnlap8MqwUHJN5rwZliF4mh9YGt
         hi74e+tNBXu19EvbvQnhDE2J+gXGN7J3s5ROvxxlNg+FQ17BWvZXPlbHqUItefylLLSX
         Vmqu9flgvmZSvhicplGEWsEF1VVlLOXjd2BSSZ49RR27vwxqRh9FoGh8GGhMOtsora/N
         TwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784836628; x=1785441428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMq/+2eblzzeE6AMRwMGsvfqnhpd6dQiBsU4+qwl+f4=;
        b=YqFR8USIrLBpbKAbx2FzIClirbR6ay7LAuk+97UFH7ixvZESal8GVeAFdh6srn9cwf
         icIFJvzXzAsnMq3J5TXPedmJOkBJ9/nWPPriccl4kbJeLMk5ojvThsEcmAP2MQ++P3ir
         iOwRMv9D2mcvbxdL87XuzKRCn8SDzXMOmS59XtPHzNeU9E0eQvp0+ORsc99chai2HV4S
         JaULTgJEiLK7cBYvqK/kSSjttbWI/rQVaPE9m8DRFZzew6XNo5WZaVm0pOqgc5EaIFsc
         zKMjE697B5yh9AtXE8vSHOaT0GBnkbtJ0kbDeeyvGz9XwAkYXUnuUL4Bp1T+ehi2bXUp
         WQoA==
X-Forwarded-Encrypted: i=1; AHgh+RoHzYZspNs6qdO89uBiFDKZNegp0wanQVboFloLi0hgSZRThGgVpl1xlhWCU8wXLGEDvCxBfMhC4U4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6TKDKEzw5iq8kjBErBKoC8cPoivMd+VIGT5ebzlJmLQIWFbWh
	paJcbivVUMfmCOQC0ZweMjJubZyuVFs704WHWUMMnXI9/aEPEUXRnuFVJTW+Kw==
X-Gm-Gg: AR+sD13RIqi1jMvBDAK1RG9nCSHMRzS+P9lQzUTGVbtDI+lwLFlU9E88KJ7kd80HpMx
	lm9kpipcq3QWSqQCLPPR1Ctt4UTV2uNjOdyyM9ykFe06mZvWqfCYsDfSmG9GmQ5oF7tB1ZXnSc1
	0HWuCg+IpT/vCL9oWfM9RcRMP0gYnEQL+JVTA0wtGeqfI9VA+I+pQbTIDgXDss9ooM93k9wHIPq
	F0vUPcfPRRkpLlxynR9LkUeDoi6587ZG2Tg9YHyUp5+KuGpMohbhOzAaAcfb8ZkrWur/cnb0nZ8
	6f67pwBDHeYx6ZUrxQvXtG2KT6qhQvV6/kbxtptUzxaro0/eqdy0MvvfEFa8S4DPLUXbLnFBvth
	NPV8YDzqHTU14vEK3enRSbiASQEd58BcEDsv/X2GADNmI0qoqhr+NuEPPTpkzX4+rJqDyZXg2Fc
	LC5IDcCNaYaP1sNMBTwNlY8Q==
X-Received: by 2002:a05:6830:83a6:b0:7e9:cf6f:aef8 with SMTP id 46e09a7af769-7ee440279b2mr2712185a34.11.1784836628323;
        Thu, 23 Jul 2026 12:57:08 -0700 (PDT)
Received: from capidev.localdomain ([177.245.227.234])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a03c856sm4215297a34.13.2026.07.23.12.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:57:07 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: Oliver Neukum <oliver@neukum.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Subject: [PATCH] usb: image: microtek: stop SG processing after transfer errors
Date: Thu, 23 Jul 2026 13:56:54 -0600
Message-ID: <20260723195654.152104-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an SG URB completes with an error, mts_do_sg() calls
mts_transfer_cleanup(), which completes the SCSI command through
scsi_done(). However, the callback continues advancing the scatterlist
and may submit another URB for a command that has already been
completed.

Return immediately after the cleanup so that no further processing is
performed on the completed command.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/usb/image/microtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/image/microtek.c b/drivers/usb/image/microtek.c
index 1f0b3c44d388..787cf5aba55d 100644
--- a/drivers/usb/image/microtek.c
+++ b/drivers/usb/image/microtek.c
@@ -475,6 +475,7 @@ static void mts_do_sg (struct urb* transfer)
 	if (unlikely(status)) {
                 set_host_byte(context->srb, (status == -ENOENT ? DID_ABORT : DID_ERROR));
 		mts_transfer_cleanup(transfer);
+		return;
         }
 
 	context->curr_sg = sg_next(context->curr_sg);
-- 
2.43.0


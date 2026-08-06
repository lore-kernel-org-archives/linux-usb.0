Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A24344D9D
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 01:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785980121; cv=none; b=msqRMLRq+tYIcPc9CUGW0ZRJm2We4tGcnWjp3laLZxupSnDYEthNcxBwCDwPSoWPjbYMc3jHqPGPaXb/gIsiYKDUvZcYCXLx3fSI6af08qCtycIFj2V3bgs7lAaK9AdLNYKuXuKFr7CnA0XWioZLp47Y5C0ISVY4F7Q2CHtMpQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785980121; c=relaxed/simple;
	bh=nwn2lZ3SCz5qyQG6mlgmrXj0cWktoRX0y3iA14280Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmEbf0zdV57lUyR8yVofUrPNkPZhE4LpBxgij4I3dkXaU6uME2gCKDLqNdJT6STAeXl3zONIUFsCJzI6HKQ50Rq1KOlCKCO7hqdQUBiWScSEMaAmDlHDkAxaIIAdj01UnK1/cejPfsQdT6tIPI5mkf3wE1tlyfAH25mNmOVwOH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPCk4/oz; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPCk4/oz"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f032b47e3cso10844876d6.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 18:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785980119; x=1786584919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L68zcBOEKqyAHNXodlM2tK6G5hxNC0P7ha7It9IyfZQ=;
        b=lPCk4/ozgel0NgLcQzErGQYvIEmpcPQyAPYszHioXVnoKawBltEuxH0dWV7V/X1Y5i
         XPbYipevNDTcLeAklMkcQe9uXJCG+1JAmdhD6nXMuNpwfj330zLchmQ86jdydWMHp1hV
         z2J3cjrdPfigN4yZVeInWfyAgC+B+OTm5D2imsZ5sjiRblFEbJCEnLp0Yhdd//HXdO1w
         J9obau6Mj7UmD/dbCmfkEvjnHQOwKeXEhRYIqApU9S0vqHa3fA+/j44QSi4Z4p1Fqhqt
         qAGYLxEHM6kozZXsXAGJ99MdjHHoqCqrzMsEE04Fn3W5xZn6p6jZV1RL5B156ovHGSCD
         C46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785980119; x=1786584919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L68zcBOEKqyAHNXodlM2tK6G5hxNC0P7ha7It9IyfZQ=;
        b=CloLx9ffEfpAdbpq8kO86eRDmfXGozewwCLjqpsbJJVCfQxnOZUsHJaCvcKjiYf1vU
         Qx+1hxzSY6mf9sq7oQT5QXRlGaJHvLQXeIME+qBnmw0U0MZjBmY+aXBdXGwdYgx7BI1M
         gETM8pQVl7sJzTBgo66VvUjCuv/NXXRlZ2sLJgrcFl1SEFnj7zPudn3I75Uvv6PepId7
         40lpgqa5gn6+JYKTkM4w3Ekv92gkfG05rgqqOAnIBFYEv/JcwLvbCzhCqYHI0qjzbaWF
         DvH01PzKmEasjZjT1HHdmYSdaf7rvg/w0Q5BYZhdoUXfswexme9eAK057REM9wikYH3W
         3gzw==
X-Gm-Message-State: AOJu0YwD/H4swEfdj9am55M5Y/d9E3X3JzqtHe+1igUJftkShnkMWQD1
	wd3mYq2YiO99ryVgTt1zhr9obPxD46eVypvgB9z9nLcjy75Eys7vMP1C
X-Gm-Gg: AR+sD10TsfHn4qjKhkwt7aMDqtk8V8ev/sLEf38DoNhIwWQtvZpbq9NJrTajgTwSU4c
	52DemetO2dkLdczk6Ivn/rwHpZFeqCk01jdODuJY+1i1TZkfEGew0ztGev+auafS3//U+2jTt9q
	vCID0uSQqwnj1R1gO+vFlrdYxWMZUFcaAFDCKC6Kws5R6UrmPL6M3/+lavA2ZIth+BCMMW3PDvY
	ikaoNCOFDbfvjzHF/f8wiYdi9Lr7c2rTiSWVQ5eguEnp5nBXtH0NXu8Ht+LN4Ifj0szqZiiF9up
	JywP6KsEZFmwMWADI6/B1qOWC3EkwyUWjKY9Evy84NUW5j+OsljNt/X7hfD4IKwuSR3UC7n333P
	Qj14IkA7aZQLpxi/+IRG7hwwUfIbMii0oNvX1WOhlBrBrucmyjV2rfh5LZ4CVFqVcokAC7r6klQ
	Shn2X30Ue67CldIgRMQPXvz8MybwTTdIIR3pR19YlEbypXimgoGUz35VGQwEN7Q45FkGwvK1raM
	4LcRCDMn17q0WiQxKIV+oA/fmIJ
X-Received: by 2002:a05:6214:1bc6:b0:8f0:3b2c:a9c8 with SMTP id 6a1803df08f44-908811d8ddcmr133559146d6.12.1785980119508;
        Wed, 05 Aug 2026 18:35:19 -0700 (PDT)
Received: from i4-l-hqh5357-03.ad.psu.edu ([130.203.139.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908800add3dsm39453756d6.39.2026.08.05.18.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 18:35:19 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jacmet@sunsite.dk,
	Shuangpeng Bai <shuangpeng.kernel@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] USB: c67x00: fix use-after-free in c67x00_add_iso_urb()
Date: Wed,  5 Aug 2026 21:35:02 -0400
Message-ID: <20260806013502.322067-1-shuangpeng.kernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When TD creation fails for the last packet of an isochronous URB,
c67x00_add_iso_urb() gives the URB back before updating the endpoint
scheduling state.

c67x00_giveback_urb() frees the URB private data, and the completion
callback may release the final URB reference. The following accesses to
urbp->ep_data, urb->interval, and urbp->cnt can therefore use freed
memory.

Update next_frame and cnt before giving back the failed final packet,
making the giveback the last operation that uses the URB and its private
data.

Fixes: e9b29ffc519b ("USB: add Cypress c67x00 OTG controller HCD driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
---
 drivers/usb/c67x00/c67x00-sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/c67x00/c67x00-sched.c b/drivers/usb/c67x00/c67x00-sched.c
index a832f5696f2a..ae6c94f41cb3 100644
--- a/drivers/usb/c67x00/c67x00-sched.c
+++ b/drivers/usb/c67x00/c67x00-sched.c
@@ -761,13 +761,13 @@ static int c67x00_add_iso_urb(struct c67x00_hcd *c67x00, struct urb *urb)
 				ret);
 			urb->iso_frame_desc[urbp->cnt].actual_length = 0;
 			urb->iso_frame_desc[urbp->cnt].status = ret;
-			if (urbp->cnt + 1 == urb->number_of_packets)
-				c67x00_giveback_urb(c67x00, urb, 0);
 		}
 
 		urbp->ep_data->next_frame =
 		    frame_add(urbp->ep_data->next_frame, urb->interval);
 		urbp->cnt++;
+		if (ret && urbp->cnt == urb->number_of_packets)
+			c67x00_giveback_urb(c67x00, urb, 0);
 	}
 	return 0;
 }
-- 
2.43.0


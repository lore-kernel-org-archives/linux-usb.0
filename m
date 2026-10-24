Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792831088;
	b=2PDOX3ovoPHmdNfakx8FRDBadXGExZB/KCZxf7zho7soOi9mzMLZue1sf839o5XeYHVH
	 lBpYbe1UUVgJ4jEt0g/ha2KNMEghXarF6sBkb55QxYRqNJZNBkGoXIh3pBLfA3G1iQyyp
	 Dv28Zc0TMEsqOjqVu8N9G2orD4v5Z4GvntiNBtHc6UrAn7p1AFUFgIJSumvcJ3mqRONPM
	 0fSJKRJHmD9qgT/G5nfzBqUkU583NUIHN7QBfBeLIMX7nmMVXBR1pens/uXHCV8J/9tf2
	 5nrMIZRni0sx7b4yITynnI9BhKFCFt8116BexSOUhnAPXLr6ydFXhaBVZqkCZW5XzNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792831088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gwbgZsLn0u2FeW1NnLX99L38TmXwF8CZ4LCOXWCfVz0=;
	b=pC4QptA/tOm+iTm3KdTafhwtqumWsgGsBheFaOxCF6XK0NflxqXZUpAyW1iTpCnM0Tp3
	 7nsdSoF1SxGrqjE+RQjIhIZbbRRnF3L3AmWMNdEp0zWl+tnIWqbtimwQJEzN31YUBCCSV
	 ZIdEOykbiZQV/hAe+HftSu2OBLuXZNcY1mgDtwpmCKvUfkYDQKatxiCsw3BDSiV4fDBXB
	 D7mqcAltXAKHFeXGBaX6d2dwNlJuaC6nZwxkNKTYXV0mZPY+4+b0itICIvEbr4OffAdhG
	 d3zLeACwYYrGRczcxrxZoqu2A9eJcka+T4rXqmjRp20Y8Cqyq67IQ0q6MC5BiAK02Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLMuBOBH;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81249606A31D
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 08:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81249606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iLMuBOBH
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso22295611fa.1
        for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792831087; x=1793435887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gwbgZsLn0u2FeW1NnLX99L38TmXwF8CZ4LCOXWCfVz0=;
        b=iLMuBOBHWJFg453Jpz9ZxWwyULw3uRF4CDdHiWyWb2IShq0ecwM2MoTwTOmQrSVLAh
         ix8QJ+GRjMastfznE9JRbjLTwfZL2f9mA5UJ+VFSKDMtTsQw3tC3jQImNR89ENmIflFZ
         fcV+s3MASpXaRTY8S2c1rBoDEfaI2xSd7LST1d90bZ1/rgyYdEaVIM0jSQrrydCEex2U
         rkXA6/4Gq6ycci2ac376WkMcdTqf/dxl8r18n81LJdx9Q+IaT/1RWnPtOCfBpa05sCDp
         8zwo7TUIaWddxDKU4RSFs8TQpz2DWS2QRceLZtD77O3vinGI5lV7DpmnT08kY560mrfZ
         CWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792831087; x=1793435887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gwbgZsLn0u2FeW1NnLX99L38TmXwF8CZ4LCOXWCfVz0=;
        b=pYPMieAvZTpH2N75wfwhee3kENkodWAjC3KUvyKdGx/Ti4CUte5T4KqsCbHzsshG+Y
         4HC8wic40z/tqX7GxR+XJZGxuk7SwrGUAMZM3ElC8huv+uejOhMiQ+/M+iN5PFawSm+A
         Q5k4rWP/SrjkOowbBeAHtfuKT/S+Cxa9krMD7Ai99dYWj3giFhoWzDDikhPdgoONk23q
         Ra5avvm67NN0W7jcfDKGNF8msI4TBc2Ya+7P7s9pue7DtVkZmpssr0/RKaeowwuewYfY
         z+nRMFHkMTy499dCuW78g9nhn4f0ej51RtqPXdU7W2h1WHVgChSvkgxGlTSdTC3nXAsQ
         ocPg==
X-Forwarded-Encrypted: i=1; AKwUvBzT420HSLKyZkxK1qE5ngx92Bowov8+MDSqLEwcqogR5XE3JaKXoiUlRjnjudgyK4Njp9WSRzGoG2w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1hQk8KIPuAfbMDotyeLYtKpAggXuPdm5gxtDUbR3StthNIg1d
	1IeKTeSLi8zxBXd+EF50UXt0sR/VlqnEu90ee/JYEuzTdfWazbbZ0IU+A4S8fZ4bRR/Yzw==
X-Gm-Gg: AYBFou1181Kpe1A/ZoZbEd7KaUrqJ+R33OMxlr1ZVotV7cSTlmFuKlnG6NuzcQuHysz
	G4UVqyx5YU/ny7hzJU0x6SdNRhWA7jHLMmCekD+ZxVNemRN2tI5uUcxH9yScz4MYPiMTBoRxll+
	hhuRp1CrMUkpmPphuSDepzvpylRFMTuo+d6EKv6LyYoTikQidqstl1mctEF6vFPf9uParzM0ZN/
	4qWElvsLifNKs8oFUCssFPacLz67QcPuzprj5joDnAQSCp/EKAuh8g70AL+uqkRtFa6lnmqdNVN
	gtWOlfI2mrq0EnC9uruzvOZo1IRrPGm37mUVSU69D78JprG4pd0yFjn+zsynIEgiwbENuGdXArB
	3XXgF7s24IokI1eOM5O+1qKwAmPQLUp4XER3oDSiN4xk+lyQPkJNcyPeMETxzrkemqZXQTh/opL
	W+gTES0uK1devex30zS6YsJW2kvNQxA/FQASJP16P/Zxa34i0naqLUwOHA+RHsyM9kaq7oabC54
	qjUxvmtqy6oEE8oMzIQ8fYsm6lEu/G7GO0L/spep11R97m47i3FLBN6UEHf147F9wN0k5aqK/Id
	/pEmDaMXngu+9WzDx6/P5hNdPdthdyx3ez8XNOyIyvG5OLoNgHlatRVrMcri
X-Received: by 2002:a2e:bc27:0:b0:3ac:4f4c:8da2 with SMTP id 38308e7fff4ca-3ac6fd3234amr3217541fa.17.1792831085835;
        Sat, 24 Oct 2026 01:38:05 -0700 (PDT)
Received: from x870steellegend.lan (95-25-165-240.broadband.corbina.ru. [95.25.165.240])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a2d324sm3122591fa.33.2026.10.24.01.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:38:05 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Tejun Heo <tj@kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH v2] usb: core: hcd: flush giveback work on stop
Date: Sat, 24 Oct 2026 11:36:47 +0300
Message-ID: <20261024083647.2599-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023174015.54793-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an HCD is stopped/removed (either during module unload, driver
unbind, or an error path in probe), pending URBs are unlinked and
completed. However, for root hubs or HCDs with giveback done in BH
context, the work function usb_giveback_urb_bh() may still be executing
on another CPU after __usb_hcd_giveback_urb() drops the URB use_count
and wakes up waiters in usb_kill_urb().

Since the caller may immediately free the struct usb_hcd via usb_put_hcd()
after usb_stop_hcd() or usb_remove_hcd(), the running worker accesses
the embedded giveback_urb_bh structure in its epilogue (e.g. clearing
completing_ep or clearing the running flag) after the memory has been
freed, triggering a slab-use-after-free write detected by KASAN.

Ensure all giveback work has fully completed in usb_stop_hcd() by calling
flush_work() on both high and low priority BHs before deallocating.

Fixes: 8fea0c8fda30 ("usb: core: hcd: Convert from tasklet to BH workqueue")
Cc: stable@vger.kernel.org
Reported-by: syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspotmail.com/bug?extid=a5b220cacb0618384d5a
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
v1 -> v2:
- Use flush_work() instead of cancel_work_sync() to ensure no pending
  work items are dropped, as suggested by Alan Stern.
---
 drivers/usb/core/hcd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 8e8a5f59b319..e6854d67ed8c 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2787,6 +2787,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
 	/* In case the HCD restarted the timer, stop it again. */
 	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 	timer_delete_sync(&hcd->rh_timer);
+
+	flush_work(&hcd->high_prio_bh.bh);
+	flush_work(&hcd->low_prio_bh.bh);
 }
 
 /**
-- 
2.47.3


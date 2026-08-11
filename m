Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897023BCD2A
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786464373; cv=none; b=ClTylJI59UPj4m4FuX56Ta79tFyoEPB+MBfdOn248aUrZGprZycUqxvHg13hrdcvGuWcCZ+MUhQKTHtvJ9htzh83anmmHLqxTJ51JWFgZCqu0R5M52x04aFanBIB4WhwVvV5CFyuTauzQlNk3WUW1ukLUqDQ4uLGrivKW5rELew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786464373; c=relaxed/simple;
	bh=blXC5e0KZHk1YHv30PmiEX0Q+MgEcCUalFjtGqEB5yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZKG1CnzJxx5IpUIdx/HqKHwc02iipCy+tsPQPbnwyzKct7IpvYR0rLxmyxLN2cgtRsqgoVmoPbhNjG1iAEkLK4XxwbPXYP/lu/HzNHZ0aOSLLU7qAT5wO3nzllDx0b/2t0EM1Zwff9TEUTqqEZpunKSB/cWg9YCxBWZOqXvZvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EV+Qe4rc; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EV+Qe4rc"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca957432c7fso3180763a12.1
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786464372; x=1787069172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08+JVCoykFuITQSLu1Wi3ijopmQ1qTW/3NyiDfbt4iM=;
        b=EV+Qe4rcILY/ggRUkMkfZB53UvLGTBn09zml6P3gMpB2uGCydARTlobuZc4yTvYGmf
         csCFcokjFnneBg7+/pf7Nm7Jw8TZgAP3KL162lBl2tHrEKq8NbgoUbnSKkPZ1ejMvAeq
         VfaD9UwgU0tYLgGaZ25L4w0sKIdKFCGDPIfEdB54+Hq+PWuhBMtAM9S1ToHDUfQ8kCNm
         Tcfeky6/bEgH8n6GkG8w7xAor993TpcSoygLowts8KH/2NS/ePXyA7c+Fn88kT36hy6F
         PBpvStv2/3PkETHMh5hZ0TpVgJtKgx+3fyCoaVWxFJOl5MgOMVRl5FXKLTlaKFgX09Mm
         IGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786464372; x=1787069172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=08+JVCoykFuITQSLu1Wi3ijopmQ1qTW/3NyiDfbt4iM=;
        b=A40TuBfU5KvlpPhQVb2TKEAc3aHoeUm5kNzZqVTS/Q37oUMocehQPokOtgyiUGrdIv
         G1sZFLwhpHMt7QdsUhFkmPs6w7jzDwwcJb+/mUwpg3eyg2IhhGwv0A6QwXg+pD7zctLX
         jVRsYJ1dC1B5/6Xi6z1htdIPLbnRIiOJSQLWk7N7jKL0BDQYhTHwS4G2FXtym34u7ESQ
         JBfeeGXe2h6+WoINGb4pTWaH/I3UdzbfbdVeJvVROJp/jFYNkUAMLRtDBrt4DYn6LvmG
         TRGnOOoZ6BzGxy3ufGxvChDkxvO+PGVwvtLI7+QtM2vj+BjvyOmQqsfzVQKWAA7ELGCC
         vuxQ==
X-Forwarded-Encrypted: i=1; AHgh+RosySZc/iBrfZrvMhxbGb8tr/sUmvc5c6u2cge9DacfyUAFpMzP0/9SWz9+fcoLAqvleFQ1AqwN5UA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2CTmztpUKzrzNW20cmwYMGz3OyHM/wguXC6bRXpQz78RTIPul
	e9YqfZ+AEBnKWxIJCpmpzrCi/GOsn+b7S9s4ImZoBNN7w6tkNDQsCjju
X-Gm-Gg: AR+sD10ktmbeuFp0OIk9f+nzLR4p3VRn2nQGunA5K12Ok6ycCzOe77UPHt9JwB3SRqv
	0D80aBWHeDPZOcj0xcvM1F2l94G3eISZTKo1lfjGkkBlMezcitAiExWav3Cpn0gnKIgN7EWgDwB
	sFksPgyNMY5DdN8LK5ElOsAbb8hCVuX3qNzcUcUKu5z4n6qb+8Oj98ofoSc1pkuqJlNcQdbxSmf
	d9eruh9fWUODfcHiSzLIsd2VlEZwJo+Bg+LPgOJgy3DsTwpXksOwQnhHttidiN49xldel3lpKXy
	nNqjcrIjpQHhQmOi9TuaqKf1tVCySzEo3/cb/scZJLATFLqm0EjtIZ4pj7W9gxtWNGkrFggBHGm
	YjRey01sOv4rwZvuE+Yp5d27OXz/iB4SJiGyzIWW5ODxtYe5CsTjyu2C1NoqRd2Ceme+o+cRy8K
	Dfpdd4CIi0ejDHjac2dJxBRDfRslZYIiGTbyiXtjP5aE59CGvkR4fiVKuOlq/VaVYsIA==
X-Received: by 2002:a05:6a21:920d:b0:3bf:ba48:ca88 with SMTP id adf61e73a8af0-3cc2b8df241mr6461260637.15.1786464371694;
        Tue, 11 Aug 2026 09:06:11 -0700 (PDT)
Received: from Default ([2409:40f4:1011:30f7:310c:32cf:5ea7:7043])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3624c08sm916149eec.5.2026.08.11.09.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:06:10 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	gregkh@linuxfoundation.org
Cc: i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com,
	Jeffin Philip <jeffinphilip14@gmail.com>
Subject: [PATCH v3 1/2] usbip: usbip_host: fix null pointer dereference in rebind_store
Date: Tue, 11 Aug 2026 21:35:40 +0530
Message-ID: <20260811160541.29461-2-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811160541.29461-1-jeffinphilip14@gmail.com>
References: <20260811160541.29461-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rebind_store drops locks to execute do_rebind which sleeps
during which time udev may become NULL due to physical disconnect.
Since this cannot be prevented and spinlocks cannot be obtained
in do_rebind, we turn towards the function that performs the
same action, drivers_probe, safely. Remove rebind_store and print a
warning to the user to use drivers_probe instead as a safer
alternative.

Reported-by: syzbot+af76b01c9a0f0ab60fb0@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af76b01c9a0f0ab60fb0
Fixes: 4bfb141bc013 ("usbip: usbip_host: fix to hold parent lock for device_attach() calls")
Cc: stable@vger.kernel.org
Signed-off-by: Jeffin Philip <jeffinphilip14@gmail.com>
---
Changes in v3:
 - Addressed the race condition proposed by Greg KH in v2
   discussion.
Changes in v2:
 - Addressed concerns raised by the Greg KH in v1 discussion
   - Added usb_get_dev() to get a reference to udev preventing
     it from becoming null after the null check. Drop the reference
     after using it in do_rebind()
v1:
 - Initial patch with a udev null check that returns -ENODEV if udev
   is null.
---
 drivers/usb/usbip/stub_main.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/drivers/usb/usbip/stub_main.c b/drivers/usb/usbip/stub_main.c
index 79110a69d697..013f1563b1e9 100644
--- a/drivers/usb/usbip/stub_main.c
+++ b/drivers/usb/usbip/stub_main.c
@@ -242,32 +242,7 @@ static void stub_device_rebind(void)
 static ssize_t rebind_store(struct device_driver *dev, const char *buf,
 				 size_t count)
 {
-	int ret;
-	int len;
-	struct bus_id_priv *bid;
-
-	/* buf length should be less that BUSID_SIZE */
-	len = strnlen(buf, BUSID_SIZE);
-
-	if (!(len < BUSID_SIZE))
-		return -EINVAL;
-
-	bid = get_busid_priv(buf);
-	if (!bid)
-		return -ENODEV;
-
-	/* mark the device for deletion so probe ignores it during rescan */
-	bid->status = STUB_BUSID_OTHER;
-	/* release the busid lock */
-	put_busid_priv(bid);
-
-	ret = do_rebind((char *) buf, bid);
-	if (ret < 0)
-		return ret;
-
-	/* delete device from busid_table */
-	del_match_busid((char *) buf);
-
+	pr_warn("rebind node is deprecated, consider using drivers_probe instead\n");
 	return count;
 }

--
2.55.0


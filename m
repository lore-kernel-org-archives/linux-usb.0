Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852C430D40D
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791654262; cv=none; b=Am2vfnU37WOjEzAPX/v45ZluApyVOd+9a7m1fVP3Ys5/3BBe3gcQAwXV8XwGJ35Ky5gxo0cirtwZla2j8SiIERKsfAowouMEiZ+gETOzSjC9K3tA5yNg+jNYFpyB/ydmVWv1iAOr0iS1C4WD3RN751dzt9HJ0XjCSwaPP3PBDwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791654262; c=relaxed/simple;
	bh=kDjzN2rtxAiNCvVFbfiN0eN+2thfiFC0pn/TUwrUwrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SLRuY0wWrYs3VlbeuCe0tfKpLxDUC3+bDGqf+9FLDG3t/T3osSDjs6O/pfmb5L/lmEcsqIQR8VMhoY49iK3q9VDMOElXKSceHSOrdgmJf/URRFnuyHBRoBS5BQbxoePweEfbiEfzJyOzErGfNm7bnjNb13Q42Nn20xoTlolA4WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=MroDw0ed; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="MroDw0ed"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e762768f3so92896485a.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 10:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791654259; x=1792259059; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHwKlOvXXIWvCNcLBoKdUP7mR1ynR1XdMkGxFBOX0VI=;
        b=MroDw0ed+Od6OqhiEc3RAmJBBrPGa5Zpx0I2C7qhm8dwbBslJxFsULjlrWr5uT5ynQ
         eslqOf7ub3Xjz3qOT0dqzxFQNxSNDGqJ3QA+Dhuhr8AvqAyaIL5AOIaExAAsPu9s8o8t
         Gkkdu5c8zpeSx9ZTT6sFch9QeI70IZ7RrYk71w8OD8xbY0WgJrX5KguKxML/ueIDvp4Q
         pKTGztRX8jsBqsTK0E2XhqsjGAMtA9K4rYA34SmRvrLBxowuK9DIIgGudiAe2vncQcX4
         qOOfnnBRsvAb2Y3om54qHK+omv49IAGF9pObz8dcKmO2nIerhQmuyMj8ys5YjceWSyXr
         AcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791654259; x=1792259059;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CHwKlOvXXIWvCNcLBoKdUP7mR1ynR1XdMkGxFBOX0VI=;
        b=G2zB26nZcNT9+VE3LTEVvB6Pqd1m/1FLcyNVVseYlLYi/A+hRwwL7rr+DtGbtmmz/l
         8dAAZODXeGG/wwMqNKJmhxxI1o01FXi/WzIKqxvS+eqNAzYo9+FFP6E6k+uFdcN1gkLA
         dI1CzDEoGxCwvRafAiK6mxJuLpZRu+H0nAtca4Cg8cixaVRBc4LQ8XUTrRaI0+HDygY+
         SYmveZqCmK5ZANFetdhDcgE87Obguz2s/Ls4gqcNjd4gQp2/mebHjMk9RrsXHSJbe8vM
         VcYxEwokyEskOkQxtFBV++ez/Yt7BNhaAx0ozwA0sBrSBXZ0jRMKjcs1PvW+R1F/Xs9V
         nRwA==
X-Forwarded-Encrypted: i=1; AKwUvBzVOJxURZKXcteML34KhtXo4mNbJpgdhctqBDjGTLiyF6ooTU4Qwe6sI1bcpw56Z6njQGu6nkkpd3w=@vger.kernel.org
X-Gm-Message-State: AFq9FYImGVmhQJYxHpQFBzPcPZbJSAKQrsqoLpREc9CnOV7lwEQxUa2k
	gN3oZIRVv5nmC6zqGdEQBS3bFAD7c+kdTmuXPZ0JKb0hr/B2Z9DtuZkKpiUEm8lnZg==
X-Gm-Gg: AYBFou3xk56rSo1GF7gd5N2Bb9oOyfGNq34GsGoLswKvhjg9h0IR4SUKbI+Ap0HtICK
	5aiRi5eL2vgGVgAMmN8VfeCAfB5PymkBsLIXtZCZ0yVbQFYGVVzcqpCGhMYUmqrWkgyBk+CXH1i
	4vTfOOHi/90OEGaedBtFrIV+7Dai+gyeAr77abOQPQiZaV7T1xV+VFsrvKj/QYzjVswfBGISVUF
	Q8+CsiJAoTv/zbco30Iow1WEnu0abnCDr25Ra+v+v+IBoGx2gKsRo6l1O5q93p4L1U/WksS4D8j
	jcFeoVHd/1k2Jr/RgvDbQAqknswY/IC3wZW5ahC1huj6lCyFh5uHZ50Sl2TdmoeRUm1A0fRbpZp
	iNbEymPZH8xBKlrWMrfItAwuHlevtF/C20s+/Zu64uhXRi9HkjZArQAav0ccOV4c3DW38qKo0j8
	4x1JLkurxm3UdepPJjVCmBptFN6XfRI2yqeR1ibG/osKWPRzCCsvqHUgV+GeL4Sa7QjKNunho=
X-Received: by 2002:a05:620a:394d:b0:93c:c4da:f46c with SMTP id af79cd13be357-93ebd27e0a0mr859848785a.56.1791654259287;
        Sat, 10 Oct 2026 10:44:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c818esm471726285a.36.2026.10.10.10.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 10:44:18 -0700 (PDT)
Date: Sat, 10 Oct 2026 13:44:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzbot <syzbot+25a1d2907885b2182275@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] HID: core: Fix out-of-bounds left shift by 32 in s32ton()
Message-ID: <dfa0aa1c-e55e-4316-8307-f72a07383634@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Syzbot reported an out-of-bounds shift (32-bit integer shifted left by
32) in the s32ton() routine in the HID core.  This routine converts a
signed 32-bit integer to a signed n-bit integer, and it caps the value
of n at 32.  But when n == 32 there's no need to do anything; it can
simply return the input value.  This will avoid calculating (1 << n)
when n is 32, which was the cause of the invalid shift.

Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
Fixes: 69c02ffde6ed ("HID: core: clamp report_size in s32ton() to avoid undefined shift")
Reported-by: syzbot+25a1d2907885b2182275@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-usb/6ac9cbd8.a150a118.27e199.0025.GAE@google.com/
Tested-by: syzbot+25a1d2907885b2182275@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org

---

 drivers/hid/hid-core.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: usb-devel/drivers/hid/hid-core.c
===================================================================
--- usb-devel.orig/drivers/hid/hid-core.c
+++ usb-devel/drivers/hid/hid-core.c
@@ -71,8 +71,8 @@ static u32 s32ton(__s32 value, unsigned
 	if (!value || !n)
 		return 0;
 
-	if (n > 32)
-		n = 32;
+	if (n >= 32)
+		return (u32) value;
 
 	a = value >> (n - 1);
 	if (a && a != -1)

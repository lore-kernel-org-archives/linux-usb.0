Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B21746984F
	for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117748; cv=none; b=UyLPIgmDTqMlZkVoAYaFEufbtqnu35WwBFOxMM6q3HNUq8Br4SgUOyiXqRjXqy6OnohLujzrvvk4T+WNsZiHs9o6kS7J+lVNWlJu2rtrw/5wAk3kjaJ9YRnnExKt0Aq3AXcql6KMKUbeqOaYg3F/I/DF42jKME134xRICu5uahs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117748; c=relaxed/simple;
	bh=GlBA5EYIQ6CD+fxLgdiVFVnrJanT42tvil+T0KoJmHI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SILLMfx7oNGsHtrNraw505+ykWp9EEbK9SM35jloKO0RqnfpK7enarAIHbzUoXcBGok8AoII92KdQQGmwiDex89IfTyRhTQK8voAyxAvJ10vHtggJC2xO5juaIpDvTpg97Sn5KZCJ9nMDlp6gql77QEPNPBn3A7WuJd7bYYoLU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BL9LSe2B; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BL9LSe2B"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so187361f8f.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Sep 2026 02:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789117744; x=1789722544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nYa44DvrJZUlDmo9hZUhETJNxOcn28Cv0gCdecKcd2Y=;
        b=BL9LSe2Bpzhk4hv3BGWBQ8I7uj9xjXnVpPeiSqc3HV/nZXnrDIaJRGn67v9P8tCKrd
         /e2e09Cfajq32Bnwz4/kcCQdjwkUqZJ1lE7l8KjBOAy26kYGMrPS/LTcFmizS4QOf34h
         YCW8BeshkXIm5SIY64YIiOMIoZrpYp1ll1rYS/6LWYctLKdhGyjW1W6T3D215cDq0in/
         dMD0SUk3dsuQcivbP0h/sJg27MwBbCIIw3LnCkl9w53B497p4ncSholZ1GRoyyYY+0DL
         Zlwfnwr9sC+5TGypVsZGaFhgZywXHrxowQzPdNbiB4F1/KsxIkLhVFggv9gR5KEdMfVs
         g1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117744; x=1789722544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYa44DvrJZUlDmo9hZUhETJNxOcn28Cv0gCdecKcd2Y=;
        b=GjgNN+4IqKqOsETYAD1Mf9AJo+fqID3kllkWojIaJx9EdCBIjYb+VxiQqpK9/6ug0N
         vx/FeTPtvhD36zCti3a+cnfzXKGKquqGJjvrYgLAo5pP0jSsJL4fWcK4kzAhGG5ZM50D
         Ir9CyuJ4PxRM07WhDUhkFkrLkJjcUh/sXH8G7OZYTtqzofjEtr2U9jwhhBQZEo2Vt+sz
         gMsfinEQrV236++1FtPkUxPFLyhqpySzXLKsi/eTu1C9cWubaOGg7+9H5NBR4bam/muY
         wbw1jJ6bcdI5EVSrXLwXsVdtkmzvHbZVvMnTkupyo/fuqr8q7nEbw/5J0WZkFSg4LVni
         PTUg==
X-Forwarded-Encrypted: i=1; AKwUvBxTckY8al4qyoxYng88/B5SvlNocGWhJ43VrUD8A+dGHTqsmZkoHhEpHtfXK1n0YSYTg+Q6wxo2SzI=@vger.kernel.org
X-Gm-Message-State: AFuF++l/x5ct5gtGDGVuBwEOVu5x36BhlMnGpvYU1i2p82en4ftWSBpa
	gCmJ0AYRtAteprv8Mr/bAWYogZUFPEaIZl2ckjPTJY4ebvbtjS+mhRRR
X-Gm-Gg: AYBFou1VT4LrRzV4v6NlfcO8f+/mf+zs+SC+S5OVIwpMaelZXN0FRDZUKXYfVTmFnLo
	PGHzn3PLHRQqEgTjKWDKp+IKBmnZv9HmwwIfMmNO02XyIIufTZE+MlpwBuI7IlnWc2lbPf/RkU3
	NFg+dc+XmjzF0NTPmHgysh6mvhs3mVrZmiVsOu1SmB/JSOaGdQirZYV2r7LwP4es0AvHv/eDevj
	Jd4RQQs/2Q33NQ/SCsaZeVFqpNme9m+tAteabCe+0ePkMAv3VHoZwXuRhNZwwrXveeTIOvwuxd5
	6TApBuo/8kruU5TKnJgIFy+MPiQRUKzmTJ4yGQVFcvsQ3WSfR4edkXnFqOfR2VssKiUvuvvMYhk
	KgAvASSUFg+e35L2OHUn9ekAuJ3YrCulbstfYgEYvPZbFfmUtB6j7diswxY13Op5B9xyVxqWWpO
	BRs+hfhXI18XtfFIGzxnlRvXWXWtos3fbvXqAn8b0l9QH5Lgmtigq55NdFuZmSivLOrtqKjm6xe
	Sw7Z6Hnuw==
X-Received: by 2002:a05:600c:3115:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49e61094b9bmr41732955e9.14.1789117744202;
        Fri, 11 Sep 2026 02:09:04 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm45431495e9.3.2026.09.11.02.09.03
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 02:09:03 -0700 (PDT)
Date: Fri, 11 Sep 2026 11:08:59 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Curtis Vogt <curtis.vogt@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Pierre-Loup Griffais
 <pgriffais@valvesoftware.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, "open list:USB
 SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/3] HID: valve-index: Reboot headset on system power
 transitions
Message-ID: <20260911110859.3feac97d.michal.pecio@gmail.com>
In-Reply-To: <aqOJfj79_NVkU6Db@dhoja>
References: <20260910170254.833871-1-mario.limonciello@amd.com>
	<20260910170254.833871-3-mario.limonciello@amd.com>
	<20260910220421.40356e51.michal.pecio@gmail.com>
	<55918a70-72c9-4f55-934b-81a692d4619b@amd.com>
	<aqOJfj79_NVkU6Db@dhoja>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 23:54:22 -0500, Curtis Vogt wrote:
> When I was using Windows I believe I observed a similiar behavior of
> the system booting into a black screen and hanging. I remember this
> occurring as far back as 2020 when I was using a 5700XT (RDNA1).
> 
> I'm willing to test on Windows again but I'll need to setup a Windows
> system since I don't currently have one available.

It's not extremely important, I frankly asked this question because
I didn't expect problems on Windows. I assumed it would be either:

1. Obviously, Windows resets this device every time when XYZ, therefore
   Linux can just reset it the same, problem solved.
2. Windows doesn't reset anything and doesn't have any issues, clearly
   Linux is broken, maybe somebody will finally bother to bisect it.

IDK if anything useful can be learned from seeing that Windows fails.

Regards,
Michal

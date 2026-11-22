Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370383;
	b=TsmhvMyQqPPfUFtgSXUNazluhw5ILuWkVoQXhuqVDEEc9rg1zS4g8Upc37LPpKe+E+nY
	 tUG6a97/1lVTiVifQU1s1FhqX6oTXHCcCU7V850okf4lQ3IsUkhPiaRijjOq8OUo7G01e
	 tUhkfWAcbyt0hUuhRzekRcb6TftavrvZNtyTnjmrQTSslc9B0Mr1qTRFUY7gvfHn1xnpk
	 71ea4oKEzOkpIIWNN/GggRx+Zbmq80Iusfogh5sW5vcDKT2cvvtfPm8b2EHXFSOxXfh+j
	 iCnpZFKS8ko3C1TxEzL9wvYnLLxNArZnuBLInACXXVX49mJjkuqtYSQG9ce+fO2Ipbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ff4jSj/cKfylzuF7GrEwDeEsXTeM/Jo8CpbIJyNJYCo=;
	b=TBFf/17HrVqsWKgat2qVF3zM/3Ua/+292nSsHnWnSgbS+PY2hZyIwAhb/XPp57B7EmsH
	 NS71xFnVBOJI0724o7BLwU7HY6M6Ilh4qrJBf2dCkh1ZMoMxe7J1/uQD8hgagTfDMSprz
	 e41W1iBxpDSxAJHUbJOJ9kbvOBPUdxAuWmS7WOyvQT6UjeAUeT5UVho3nXBUtD6KOatBi
	 vhS2jpFAp2PCahFS9a7yF9X3sD0cI4Hd+VwivliAO54C7TcEIOKXgK9slIwn4+QaTGzWZ
	 Et0DCDRv9yr3tVxSzRB22NTwTdcBoq31Fw7D+N9fmFuMQwLyoiIHLHjdetXfHX0/HhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aeiniqvk;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B56606A331
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 17:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19B56606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aeiniqvk
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so1792761f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 09:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370381; x=1795975181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ff4jSj/cKfylzuF7GrEwDeEsXTeM/Jo8CpbIJyNJYCo=;
        b=AeiniqvkKWpAB1kr0/DQMkGYNw3mSNQTHLJN7Nmmnw22EpV8DjXlHk78Ro+gc6X+7y
         bEyu5oIdU7dUS+fES7gIzEEN6ZJZF6JBRg56z38NNpose9TpXxQdI7chH2eFpd6diarg
         QiKGWPzCTn9db8KVTamosYxJbANj6u5w1st0I2V07KAHZrabhXrGFidbJKqQmp6tiwuM
         4TdSeD2pwGkDRvD4D5n1g5zJ0c4jwTj1TbWDExzlsu3FERwRdmm9BRNpdodH1OSO2+7h
         P/Cns9UV69qvUotDqPTlooPiDGppd312bOvhOiy6VqbPjogz+/01Vpi5QZHE5jZyUuc7
         nwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370381; x=1795975181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ff4jSj/cKfylzuF7GrEwDeEsXTeM/Jo8CpbIJyNJYCo=;
        b=Qy2sSnTScdFe0GWJ5tuhL6gmF/PJVIX8TaOAILHlxHIeqQQAFUA5EWhJBS+s5LUxnp
         YtBedRTi5taQmrw7s+21mfsa6WEC1ThM80XFYKWoy6EpWjGQIHQfbxpcmAQ6o7zdP7v3
         ID0PmFJEyhwEk9bySGY4iJuT8Mm05MhybRRMEa1UZ83CK49hpg9A1FblJ1JdoK6j7Hd8
         kuT+jKJ0riICIJ4Dot17gJbYSpaYw6wPCoEjVqj/7K1b7eYZ55U0XJH2feJKRlSjQ/Yn
         RHxyHLTJa3SxbQWrGJLsRqxyyZoMboRxqLLJgIh+IJQAf4hk/wu9fHrQLsKtNfUh8Hc/
         2Sqw==
X-Forwarded-Encrypted: i=1; AL+hErEM9aIenHUptE867KOLoYdGC6lsW99PZNXJ+jFojchUdnqK6QF/87GKpf4uTMHT/KsK9jw5d1znY/w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3P33vyM3bzNr/eyRyc3J3r+J9goAiLcr7qlhshrJ5VRsu1G92
	7qQAuDbj43XEwdJICiODQlzVzlvlLNeJVF8bJ+Cz+cs2uzJ8Z30eWenNmlNUq4Aj
X-Gm-Gg: AZFdTZdc9w3HBkNVjsTNh56KTypiCe+9eF1rnIZ0o2eibC/Kf6QBL7aaC7LlDSHrTrU
	eMAbQa56/k1MiDY2uQJ8EFYJWst1bTG4/8Qke8u1pFqfh8QbjFPgxTuiz+GOKrbPIrAKep/xyvA
	uU9h+xsoD6/IETD/QN75Blg0XS2cVsHSdsXJH6etfjuvQ2wYkiwXH9ja2UjLAH/3coMBD67kJvb
	QVeWSbEQ8P+Zmuii84R1MRodXWOusNSpOdWuuIq9EZhNdxFeon1pc06j6Sn9iacqC/sn6FkGS4I
	fykCFGtztb403hEvuYHdludLlbrkdn3CHvL+G+Wr/TD7ILVcZ0ngvjnY/UW9NJW64fFsuK5JveZ
	GPgqvlcXo5P3RndG9TPTaz7mgqqJm+JeGLjyb0HPW3KZp4uopIwquMFc1fv505pTPwRcSQ2uLXM
	InU5/8uLd/UKxIX4ak7QqxxOMcChwIRsc/fA9ATSDSUeEb0lwx43UrFafaFgdwGypPBfZSGqnRZ
	WRmQfk+X5dh383qxlfpSoAmTElbxgUInjCMGAEL8dnYS5Ijgh02t4nY7Eg0UrkNAnwsLpKXf2Yz
	0JIV23Dn8iN1jYTtXFPf8vlWSSYTJoc4Q8u89LQNGC/BiFZRw/HlIRWwYWWt+iGrqIb/yX+QwH2
	YkA==
X-Received: by 2002:a05:6000:26ca:b0:492:3176:3d64 with SMTP id ffacd0b85a97d-4abad5ac748mr18217584f8f.8.1795370381218;
        Sun, 22 Nov 2026 09:59:41 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm17464646f8f.32.2026.11.22.09.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:59:40 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shichao Lai <shichaorai@gmail.com>,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: Re: [usb-storage] Re: [PATCH] usb-storage: alauda: track media_initialized per port
Date: Sun, 22 Nov 2026 22:58:05 +0500
Message-ID: <20261122175805.2955-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
References: <ac19e630-f96a-4144-88dc-e3f22091c7bb@rowland.harvard.edu>
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

On Sun, Nov 22, 2026 at 09:53:25AM -0500, Alan Stern wrote:
> I asked because when syzbot tests a patch successfully, it provides a
> Tested-by: tag and asks to have the tag included in the final patch
> submission -- but you didn't do this.  Did you run the reproducer
> locally, without using the bot?

Yes, I ran the syzbot C reproducer locally in QEMU without using syzbot.
I also just tried sending "#syz test" to syzbot, and it replied that
patch testing via "#syz test" is currently disabled:

  Patch testing via #syz test is temporarily disabled.
  See https://github.com/google/syzkaller/issues/8122 for details.

Also, while checking lore.kernel.org, I noticed that syzbot previously
posted a similar AI-generated patch from Aleksandr Nogikh on 2026-08-28
that never received a reply. Please let me know if you prefer taking
that earlier patch instead, or if this submission looks good to you.

Regards,
Arbab

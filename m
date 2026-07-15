Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B938044163E
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784111298; cv=pass; b=lnRsVL8doCDjMNvMkc/v7U3fRqR6wJwaAvidZMk25QHHqM1Nv2AnY7+2jtmdSfUtWb461pJdAy5fdEbeaB08xuYRoRNTrbi2ncYDaWEuUQHltrR8yQk43GiQNusGNt0j+n2wdUGPN5rnzXb17psOjYPg7locpBmJmOFK9bA0p5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784111298; c=relaxed/simple;
	bh=sdz/WAGfFG2PTmUZ1wJMxa5wHauvvFsHiUboiywwFiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aB1MfhtcGut73jwdZjtJLdcdmpiQdi1Cfc9k45hG41aV7g/WY/Ae+Y9DqnjPIKugcmfoTiq0IA2vANojdypq/4NhfgCbSLM4ZYGbIFScj945DlZxv4Rs6Jcl++zBeZi6ZuThCEgdtxURx2k3iGkO+9r0XBvVtOowwUvrFsOTEU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bwo7DQec; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bwo7DQec"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1972542e87.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 03:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784111295; cv=none;
        d=google.com; s=arc-20260327;
        b=QSmTryYqMG3b7hH99NThescdzIqd8wCRKxZa14HEBmAxJ+nTBg8MSRebgjE+71wum3
         1bPCLjTz13xQuCE+9oqz7Rn9S1/SEDpDw9egsyCmOpzk1vtfPVkIwX6jbNNbcHxC3eWJ
         qyr2e5CdilK9Z3EQTittdD0TVZLKkhmI//Yq9XmDanQ12y42QoxedTAAuVVlPbarbxIJ
         Kr7P7MwaDm1TkRZz1dqrelNIpzuToomKXfsepNuPMpBipRstBj3189ydlDHDh3P1NKgp
         gMdjDoSV4E1xqpYnWfkOV0DBTRl9H71HoiS9AxZMmOS5N2+aohHP5LhsuJv0XdO/eHqS
         y5aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QPvnZmvDyFwzWB/pCYkhKpUQPg4ZobgLnpg06TR5Pn4=;
        fh=uGmjPMf7B+u/BPA24eylYdtp+NtNX1mxTITCQQXLQNY=;
        b=FrABwdF9ZtWKw0egacFUrs4zukLdq+GjessCOss3A8Td+f/GqOC1aqDLeZGvSiPj87
         VqRcl+2Bw7s7zHh7/CVLNkdnyY5buBdP/oTFaSUs61MBkXGagNHD0xBvGm00Yz9kcbFj
         JSiBIhEjHnLaS63QKYoae93Z+0kf7/4DOtmImHLTmYb34p1KxFqYxs0Cf3jV+1ezn9VK
         KBBxIDAMrVAEcgtxLbxbL6Td+/NgU8LMLpgc0w/H1oyaiwsc1rhDmTD8BbQiuVLXWMuf
         Dv/q9xqpwNwmQF7G7obpYXasyNTtcGXniRLcYDWN8kKXtuTXWnEMqnoCstiWzzKaThZA
         H1kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784111295; x=1784716095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QPvnZmvDyFwzWB/pCYkhKpUQPg4ZobgLnpg06TR5Pn4=;
        b=Bwo7DQecg64hOObF+sx2++MDKhXaiv4agJ07HxwHn7su3lqodxrQvVMWXuX1OQoWM3
         N39fgEzc20gHI4YBcm9STY23S490oE6PONDUbU/f4rmyX7ZNSgxdQQrn/sDItDYsbet+
         RhvjeyD8IF1w+hYWSLLAV15lGgt7U6M5XLLSD7OeKQJbE+gsUReYgikcghGzIyuYKLfm
         yz21dxwRkzy3oqtCvNws0kx+syk2u3tkVGHBneS2I1Ofnqnjeikl4PWyWPCF4N3q6z8o
         E9Zq3lPUCCrLMrA7u5hBzwhHr4xE+kR2GZdW8o9ZFJyejxt8O5BdRSDCSi9iSWKi4ylJ
         2TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784111295; x=1784716095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QPvnZmvDyFwzWB/pCYkhKpUQPg4ZobgLnpg06TR5Pn4=;
        b=U2QMmBPv3FMd7phVJhjPLQ0KkdWosYeo0ChPwkXEjjSQscelY38g0KV6ohPUZFebnz
         sBKGIO9qfmfgFUib2URgeQoLEYkfSOoKjnaD2IIxyCZVy5zcoceYSM9qtgqsajgRIJNJ
         HV+AGiEEr6gvyx5iZx8n7ng7iofMwBRSUZ7MHFbSXbLuigUFh9HadXRk5Th6/t0Od82d
         01/UFPpmsjiw1m0jsTpj3RhbCtPSK5EKHGt+ssgagGKQsaBQ/vnBvAeqQ5tuk3Bdc+Xr
         mI0MMhswXSZwh9EikXbpv3+2B3H/gQs/nZUkjEN4vT6CREQsQ+LN4gl/ImKIjOt83ewT
         sCDw==
X-Forwarded-Encrypted: i=1; AHgh+RoG33juyeSzTTDl0RnOf0xkDQIXrR/0lIn73NJuJ57OqJleuxrcnnij6buil3afSTqUENQSyH0gbW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHZWWKeJrEc2qfMmRyR4zwrwgJPWE6C07mi1YXgqYNfC/L7oIr
	MGKkg0L0CfyfIDNgu36Cfeq7SBCXsHA+qoa+dihb+mHjWd56AAEgdv7y05hX9QliQH9OZsT2RoD
	MjqHvpxoJWrweYtR+6+HciahIVRakcqNvebZGQeleeg==
X-Gm-Gg: AfdE7clvnAMTZh0SNckhSP0le4nSXvPWm1ZXXWbMwQbNRFlQIhF4hKwbULVQwf3KO3h
	KsBqsJ3s19G9AODqEXAN2nNDPw1IW6DrNawXAbJMYg1kF+Y9o6ivcd3Gly2M5QU8J4WXoQCIGCs
	ALdwqCp1COuYtuc7ZZwlG7ED8MGtxisb4QbqEm9wTpXei8dsqWhetlQnqjaBZngpbyCAIkIByT6
	e5FBao1h62tyk5J71hnUSmLifoLT4BFW1b8JJ1uBu7zOogRAvyC+9UvKX5g6J3rwbeXEURc
X-Received: by 2002:a05:6512:66cd:20b0:5b0:1eed:f702 with SMTP id
 2adb3069b0e04-5b0236b7a0bmr2733808e87.54.1784111294764; Wed, 15 Jul 2026
 03:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706134033.244295-2-marco.crivellari@suse.com> <20260711164434.1691221-3-horms@kernel.org>
In-Reply-To: <20260711164434.1691221-3-horms@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 15 Jul 2026 12:28:02 +0200
X-Gm-Features: AUfX_mxDB8UQzuGBAa50_CUwUbLgAP9_s8ih_XJWsAHI5lvvyskjdwGSmzvPwq0
Message-ID: <CAAofZF4JQebhYv6FTHZuygnPge32CPJam=JHmVc+QVT75Jp5Cw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ibmvnic: Move long delayed work on system_dfl_long_wq
To: Simon Horman <horms@kernel.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, tj@kernel.org, 
	jiangshanlai@gmail.com, frederic@kernel.org, bigeasy@linutronix.de, 
	mhocko@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	enelsonmoore@gmail.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jul 11, 2026 at 6:46=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev
>
> Simon says: While I think that the pre-existing issue flagged below is
>             orthogonal to this patch, I wonder if you could respond
>             to the question regarding scope raised in the first
>             issue flagged below.
>
> [...]
>
> [Severity: Medium]
> Will this leave the primary reset path bound to the per-cpu system_long_w=
q?
>
> While this patch partially migrates delayed reset works to system_dfl_lon=
g_wq,
> the initial reset work enqueued in ibmvnic_reset() is still bound to the
> per-CPU system_long_wq:

I will double check the code but converting that workqueue seems doable.


Thanks!
--

Marco Crivellari

SUSE Labs

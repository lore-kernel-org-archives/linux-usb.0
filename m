Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3194A37DABC
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 02:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599350; cv=none; b=ksWt+4Cj+zHEkHvS2u393B6zmQMxoZuqV+wlKqwXRL+gcEq7C1bfxHJYVgplZEdoEE4xxqdwO6le/l+TQntdnVE4iJhL7DWovjQS2vPZZ290NHMUZVhJMknE0G1eJkL2C32/hIQhCkIOhZGGS1W/bm5elfbYbJ+x4XYGDOE04hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599350; c=relaxed/simple;
	bh=Jcy2MJFiM2JTjAV8HXPccmB5E7MpEkzAs8cy45JZFKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUvGh7LsyoLkE2BNFard6w9W8xNP4FMNFEu8SmXqSKbitrieyLLlMI+kaSh4sgtio0VlQKOjEffgYcgrFg9EKD8zFRTCCIyuquxDPbuQ0DELmch64PSL71Bu6OkVsfnpjvetNHK3Ij+9MsplLB8ygKmYfd1YjpR6FOWl/vym2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjHXDMJ3; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjHXDMJ3"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5e9239c772cso258178e0c.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 19:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791599347; x=1792204147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jcy2MJFiM2JTjAV8HXPccmB5E7MpEkzAs8cy45JZFKw=;
        b=BjHXDMJ3g128oxC2PX22D1kwaYSevb98UW8qD8tXWQoRUr9ndaAZxR0isPDsiy10Ch
         kmJZra21j50UKDor/jCPlDed8jSxnhxUMV3eCmXjjVlNGRpkOrM9hM7Ons9EzvO5dRjq
         XI+voSZ9xkgVDZVKrz/qZA8ynWK2cbvQKDIXApT14zYjkoghQUMwj0OszFAQN4sf7Vfd
         ghO50dODh2qK01RiMQNXTAyFHcCYaNsHAVA9Q7IdFPpfUdijpNOa0Aaxk6pjNRMisnO7
         N9mGAbU7cV48O5qiD2NOiXe+10IoZyeZufnJpXVP7j/5CNq2T016otnxU3uk8r2aKN5H
         EqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791599348; x=1792204148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jcy2MJFiM2JTjAV8HXPccmB5E7MpEkzAs8cy45JZFKw=;
        b=Bnq7Ep5dWJ7J2Aegun/wJSsoeK1jv5/wTYU2AAw92LMYOvD5VKnDuB/kE5pBT7Guwj
         lEDgMmmaDrxFMF+hFs1844dhO/XTOm15JnqhjGc8cZYbxzCmfCryXpCIEv7wNkn7CI9W
         NLB/DReuRpcZbQTEY/1Ra7HbO6p+tQfCUxeDH8ffEIISPl1653lth8qGkFZFDz0zRS1W
         tRV1uA48+rgPNMwwMYcqE/pGxhKqKQ4rAJ/q34ZUV86o2NOl71LLpZCXo1Sc7+yHFptY
         w8AuxCSTTjXseCASc/436sDES9IOswGIr3bdaQFiqwbWW/yKsq3OcD5dtFGleLdWfvag
         6kdg==
X-Forwarded-Encrypted: i=1; AKwUvBzk5PrLJ+QtePE0aw34LqODL2kC+I/ARjNKCPzBwzarmme9+hL4QqsSn4OeyDQ4IVwy1FKPJpPZ1dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqG9M3vCwJuGUu2So2Rjgo3X4qMULZBXV9nC7cm/U0Hh5oKNnh
	28/5wdyqzROPRC/mz9+gm15aVV8sVPDfq5T+4+8MXPyUJ+8SaZY6dn0m
X-Gm-Gg: AYBFou0HAVYO9KLG1CSCIX3+ZQxzlMFQ6b1pdNTFcIBC/2Tm/mOxI0io2JLmU86lKLT
	h4Ud1COqOVAjKw4SN/fOUD42w/ZWT20ddVrt3O38thgAk8a544bThF3b2gLqTjYJf1Ht16B6Ngn
	bcR4ED29MPo0AkindqeYPKgMx6s7uE/a5De/6Jdu44kX2Ykz6aSybsVZKRQrMki/qfx/7wiL8jk
	MlCFkBm4LIaKlv0+Ajvyo6sECs/wmlp4M8vh4Qt1h3BzMyKrWe8fpy3lRhHdpMSM0hjcaSp0DJe
	QzIBnpoFgnoDDf7rXLnh2FPEeKeY/mj1HgXnJ8zM+aW52d6xVpG1OShogcu9l6cLP3bk9iW15sz
	/U1Ux+F+hSYC/QAJgWL3b9MTvM0nRqKL2fUvijXGMQyoTyXkX+CVZfG9byKwCW2MG7mFrYVLKpH
	CGDkBTkxOWaMQ54mmz+P8E43IuWZi/n7CYC3n27xu0RVYyZiKCCymGJnTwZeM7O+E=
X-Received: by 2002:a05:6102:50ac:b0:7b3:4199:2de2 with SMTP id ada2fe7eead31-7cb378f67b3mr1454780137.35.1791599347617;
        Fri, 09 Oct 2026 19:29:07 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cbf5d1fsm3021672e0c.14.2026.10.09.19.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:29:07 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Paritosh Potukuchi <paritoshpotukuchi@gmail.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com,
	Paritosh Potukuchi <paritosh.potukuchi@amd.com>
Subject: Re: [PATCH] usb: gadget: f_uac1: fix ac_header_desc in descriptor lists
Date: Fri,  9 Oct 2026 23:28:56 -0300
Message-ID: <20261010022858.3270406-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001075808.2156188-1-paritoshpotukuchi@gmail.com>
References: <20261001075808.2156188-1-paritoshpotukuchi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 01, 2026 at 07:58:08AM +0000, Paritosh Potukuchi wrote:
> Store ac_header_desc instead of &ac_header_desc in both
> f_audio_desc and f_audio_ss_desc.

This doesn't build. f_audio_desc[] and f_audio_ss_desc[] are file-scope
arrays, so their initializers must be constant expressions.
&ac_header_desc is an address constant and is fine; ac_header_desc reads
the value of a mutable pointer, which is not a constant expression, so
both changed entries fail with "initializer element is not constant".

It also touches the array that isn't the problem. f_audio_desc[] (FS/HS)
is rebuilt entry by entry in afunc_bind() after the descriptor is
allocated, so its static initializer never reaches the core. The entry
that does reach the core unchanged is in f_audio_ss_desc[] (SS/SSP),
which is never rebuilt -- that is where &ac_header_desc is handed to
usb_copy_descriptors() and the pointer variable itself gets read as a
descriptor header.

So the fix belongs at run time rather than in the static initializer:
the f_audio_ss_desc[] AC-header slot needs to be set from ac_header_desc
after build_ac_header_desc() succeeds and before
usb_assign_descriptors(), the same way f_audio_desc[] is already built.
(Putting ac_header_desc in the static initializer would capture NULL
anyway, since it is only allocated in afunc_bind().)

Thanks,
Aldo

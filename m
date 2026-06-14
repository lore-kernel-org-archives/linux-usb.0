Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7650520DD51
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 17:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781458150; cv=none; b=sAEeLWnNU9D36czX0hnfe0fhHAcF4bwQMD7YTEU5ZisoIY+gVOxDvTnmBFz5YNffrv7sLwIBBHtWYwwXgpnMJ0klih3HxWU6dVJXSKpTHXpahaKviqWps+uROT4gihb9O4939+YwG8H3+ZyY9fTLjnZYKhxTwKaiWGfBmQppyPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781458150; c=relaxed/simple;
	bh=Vnj2Kcr1Phrtwb4GEGjbrLTmLlhtLSNQJ4KuLxPlax4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OcqS7yH23QXwaHCaxkiaXqrge2sPX6i/iVbuCOP9M1B+XFehSEvtzYcNNJa91sWt8RggiWr5107BuTj++UqJ8DCigxrb+bokvsH3gLBGFDK/ZwSt2uwJyAWQR7Uk/iF+XKaMpe9S0PGmdiylbsqr1mZib9lIB9yXp2otxXQQgOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyOpqCcz; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyOpqCcz"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ccf01ba514so28046946d6.0
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 10:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781458148; x=1782062948; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Lk8pEj3YUCwblh5VUVTfE/Mk61zPL3H8dNk2qBQA40=;
        b=FyOpqCczTgsBPMV4in5UHP6FKucAK6gtD1NSBmZjlnkKIv9VEJ7kYEh2J58NfTBGKA
         ffg1hzN9q0Cta8b3s/fgl8HabHMzOHARbYqsYJkDwUkQzPfF8wIhKU2Qor4ZePFHlwG4
         Fpny9pyzN73JQHvl/C0/HZDLlZ6yxBAR3jK4vGtUUGEewvbJXYFbY2+NpESEd4x5hmEJ
         CzYOWz+g012YkaI+3dZyCZ7Mb7MMhvTCFzntiACy9JaA0m8yRpzD/CvwSQDeO3fkDfYK
         w6Du6qelG0D5dBMb+aqQfK00qmUFGxfDQbAhxyL9bgk03X3MzcgqgiZvtixrDhyluECt
         ll8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781458148; x=1782062948;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Lk8pEj3YUCwblh5VUVTfE/Mk61zPL3H8dNk2qBQA40=;
        b=rT41eVquVpedl+3YE1tcNgEtic1e+hA+j64NqqO/we0hRH54fIVbultN8bVGFNjydf
         NZExnBHU9NeFYbLYXGuiYsYJD249dwTvxEfGTWUV62zcWMQRi3d89g+KkOyBt4nq+5Xf
         RH1kCI/N8C80RaPVZAfHSULS0n3y7R4xWfjNIFl3htVBbaRcXpp7g5Oq8WbL/uaZozbP
         tVHtzEQRw/Jfjmn8DaFo14feGgrUcvSPW9yfQAMfAVFfXaMNukalgRFp0yaEbqfUTuSD
         PNQ0aBM8TfzHEzvsRNjzjN70qPrYgEkPBlFLmbKucIdnCctRuBFy4ZnIUvckbmqE9OJJ
         BTGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9B6+8/wB8nfxX9sRjb6eaHEpIQyNFhIOzJEGdAwvycpB3oTXzEs+wscYsUZODbwRh22QFxWaR/VUo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy36WTUY5bGVJRHW/Lm2Z6ETHlsseyOOkkeyRr9S8opilVl96mJ
	l1A5JT5882mSAgoMsuH+4jI1k9VLfMwf0oShHUB8POjanZ2Y2VoD+8ex
X-Gm-Gg: Acq92OFgdyKnZ2zrWPVuL1zfVQ2pRioZYaVD5itYYARN1AdmQa6VOfPAtnH3qn43nf7
	5fO5z/5URnx2l/PUIcW0WYUUUKtnt7vPDMDRLS5Mv03snyKJpQheeiKBAIaRCj1R0oddmA2KnGF
	u1s8XcqvRcX9mHLwDwY6vMPWXD6XadzPJLalQKdvyZVLeZ1wB3/r4iqMTBxuhbzNA4qepXUnhVE
	OV6bNPEVSuEH4ZhZi1ea5UFTMw/pWvePD/TWDL946Zi9fEFaHUaH3p2xNO6siLQXjeJpEzFKv7b
	2yaAD2BuyHYIzWL/bcjrh+cJesgsqdau/03FjCnI1dpVOIWpGsbrsQ+9t8SEhoPbpQ53mG88LL9
	PqRqIJrHDAlHNnx0CcOdfXsUUEqAP127qW7yRgVERU/mHrstruS6jLAXqu5ohQpaPZ/wz/qPv6Q
	Uzak+CzcAqUXpsTdMHHSU0wZolF8gDr1p6BTkxY9Fd6nRrbksv5cUmn2Rc6HSVYQwXYA==
X-Received: by 2002:a05:6214:e6d:b0:8cc:6aa6:704e with SMTP id 6a1803df08f44-8d32c0106c2mr190274046d6.11.1781458148479;
        Sun, 14 Jun 2026 10:29:08 -0700 (PDT)
Received: from smtpclient.apple ([2607:fb90:a8e7:8c2b:20e1:3889:792:e164])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fd75sm83742616d6.2.2026.06.14.10.29.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jun 2026 10:29:07 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [BUG] KASAN: slab-out-of-bounds in select_usb_power_delivery_show
From: Shuangpeng <shuangpeng.kernel@gmail.com>
In-Reply-To: <2026061444-flattered-rewrap-3d96@gregkh>
Date: Sun, 14 Jun 2026 13:28:36 -0400
Cc: heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D027A719-E252-4A9B-80DE-E6758D810DA5@gmail.com>
References: <178144969600.60470.6584137935143789620@gmail.com>
 <2026061444-flattered-rewrap-3d96@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Jun 14, 2026, at 12:37, Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
> On Sun, Jun 14, 2026 at 11:22:45AM -0400, Shuangpeng Bai wrote:
>> Hi Kernel Maintainers,
>>=20
>> I hit the following report while testing current upstream kernel:
>>=20
>> KASAN: slab-out-of-bounds in select_usb_power_delivery_show
>>=20
>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>=20
> What about the latest tree?

I retested it on the latest Linus tree:

424280953322cf66314f3ba5e2d1ef345f21c770

The same bug still reproduces there.

>>=20
>> The reproducer and .config files are here.
>> =
https://gist.github.com/shuangpengbai/79c08ada299b3ae37b7a0af292ca413f
>>=20
>> I'm happy to test debug patches or provide additional information.
>>=20
>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>>=20
>> [  102.318332] BUG: KASAN: slab-out-of-bounds in =
select_usb_power_delivery_show (drivers/usb/typec/class.c:1642)
>> [  102.319225] Read of size 8 at addr ffff888117d2f2c0 by task =
cat/8378
>> [  102.319943] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>=20
> Does this happen on real hardware, or just on emulated hardware?

I have only reproduced it in QEMU so far, not on real hardware.
The repro uses QEMU to emulate the hardware environment needed to load =
the
FUSB302/TCPM driver path. I have not tested whether the same issue =
happens on
physical hardware.

Please let me know if any additional information would be helpful.

>=20
> thanks,
>=20
> greg k-h



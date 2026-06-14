Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C02ECE93
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 19:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781464310; cv=none; b=lMI3FGvL5wHENKmGDoCjUnqVnu+rawii4kTjd/abD+WonFZfQthkeZTxkapTXMtrE+7y4u4f5lha0zF5tHwC6uXKMH1jcb+zH8fc35Km2A2uibzW0iIgzZTefOyL/51vhw+tBuk7qAdz8cMMhUPmd8PRwb4rdNLH9iw3x59N5dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781464310; c=relaxed/simple;
	bh=Oc4NZoffZJrtWCptOazzuLlG24KnxwgLA1+XKC6m+Kc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=geyHGITR0QE9Gi9V/DxkZg8uCgKVUZ7Sd17p4NL1M+gdmXM2zDvhGsLmqPisQY/d5akXGrD5YrCXwaseN905/K7zznWeVr4Jp+69nlg8O1rvlcEsvBaYvuvyp0BmRZe0ZFQtmWMm3oMRrD0181iFIWbKdFbJuIG3H1d+CKrWAcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6EV5QiQ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6EV5QiQ"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8cce26ee1e9so42984836d6.2
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781464308; x=1782069108; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RYt6Pm+UxWAry0ZkieTkpkpp8yOGTDeiY+ywKFe8Xs=;
        b=V6EV5QiQN4DfyfRqmfpa59k+amIf+buZwPSICKf11l8nEo1K9NU+v1eWPbWs3+C4Bi
         LJ9BUeQKOcvzgDDQO18vtoD9dKIo4jVdXf/h/jx7riRrukyWezemDAqzruNHWxx6bsWk
         Nkmp2wg3vmpBM4prQLGHyWagsOP+wGrw4dOxsA5xhJbDM8DXDEzdVveVhjTZoiLYfGxq
         aHdmyNpV4hidFWaB9FuvN09zfw+mNPsdLbWRNYcZv2Xs23MOWiX90c6/0SZMGYYV1ki0
         SBabi+6DXKw42qDfnP4ZqdA/zA/9wNnJwmxDzOqUB34ThyZYuEPVK+EqP0cwYykcazNi
         EhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781464308; x=1782069108;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RYt6Pm+UxWAry0ZkieTkpkpp8yOGTDeiY+ywKFe8Xs=;
        b=cRMEb/3E8GROeVk7A9HEwN3jAE+SFtzTFg/vmDUyWrJIZgaTWmIImXKp8NyKKW+x9a
         AjFms4dsI7w/4+ZzmAdPPtbKrHIze6Ibr8j6tSMDSQpyLUvM4F8oOM+p96BLifWra5DO
         m1o5W7h8a2ZN6ZfkXhhLmzEPal7o4h3soPwiZLG3V5jV/1+sdLPimxeojJx+qzv9CN43
         1Pe8A+qNuKJUc2w0JPoiP1252OC3OiT9+4fTIuBGTMWH/31tOTOmgol3cQ3lDhUaapzv
         0pbRGvKn4vDJlGfPO24bgjBfSscmWyWjQtGfJyll17QOQzGBoOoOE68w/ckTp10HwIGh
         cPJw==
X-Forwarded-Encrypted: i=1; AFNElJ8U+FDfQOxR77Hh2rqgfF8f7BjFrodoK2cnhcag828BBX00OsaICbcJU6roCf7BY4yq6offR366seQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZXvAdCvZ6cxxS974xrPW6A/AlOFZA3kkOi53ZInXsxTSXkQGQ
	nLLFJkxyq5z7F+V6ghgS47emY9EfA8Php0Uoam63Nhq4kdHO9jmeH3iD
X-Gm-Gg: Acq92OHUVe/z1idjAIC58YHLkXrvGI2O41QNZ8a3TAR2fshjpz6LTX0Q8Wi1GpwVbJC
	mpV0npBkkzx47rC9E+BumqdPd/u/9R3yMDnnU+fJsM80igd7DXdt5lINCHR9dW6GvtABwLPazmw
	/iazqGlG3bieHR1E5eU6uUY1aoccs7k0Z9Y2gGjFrHwx5wPPfEisXk2hBvpZIPNu4JXkcRgaqlo
	9O9MX6zkTKkfSdcmrsv7+/2LPgc5q8/etM9kYBTuxasrX1LTdPZjqreASVQJXmSGQTss7297n7j
	W+2qRJ8hIvRs+9eyhF+OI2sY3SnqqcesWD4MWyL91u+puzlmRMOnwUC6Cp5aHE/0BynPIPdG5hZ
	slWNQ0q6XB6oiNgI7Qte1b1zmEpq//tvanLKacTVfJzS2oriX1nszp6exE6WEDvQ1ft6vrkERbX
	niQpO7dceMm49loWmSXP91oPYxbTBbWYv7JUaf9+z4zCTJrYWh/SNOeyD6vb7wagD/7lo=
X-Received: by 2002:a05:6214:f64:b0:8ac:b1ad:3a29 with SMTP id 6a1803df08f44-8d44f424f0fmr141011706d6.35.1781464308045;
        Sun, 14 Jun 2026 12:11:48 -0700 (PDT)
Received: from smtpclient.apple ([2607:fb90:a8d1:8eec:5c3c:2f7e:d7e3:b1bd])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30105fcfesm88575226d6.5.2026.06.14.12.11.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jun 2026 12:11:47 -0700 (PDT)
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
In-Reply-To: <2026061454-pep-avenging-9656@gregkh>
Date: Sun, 14 Jun 2026 15:11:16 -0400
Cc: heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B2D6F550-93F0-4957-8DF0-E1D544DA5694@gmail.com>
References: <178144969600.60470.6584137935143789620@gmail.com>
 <2026061444-flattered-rewrap-3d96@gregkh>
 <D027A719-E252-4A9B-80DE-E6758D810DA5@gmail.com>
 <2026061454-pep-avenging-9656@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)



> On Jun 14, 2026, at 13:32, Greg KH <gregkh@linuxfoundation.org> wrote:
>=20
> On Sun, Jun 14, 2026 at 01:28:36PM -0400, Shuangpeng wrote:
>>=20
>>=20
>>> On Jun 14, 2026, at 12:37, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>>>=20
>>> On Sun, Jun 14, 2026 at 11:22:45AM -0400, Shuangpeng Bai wrote:
>>>> Hi Kernel Maintainers,
>>>>=20
>>>> I hit the following report while testing current upstream kernel:
>>>>=20
>>>> KASAN: slab-out-of-bounds in select_usb_power_delivery_show
>>>>=20
>>>> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>>>=20
>>> What about the latest tree?
>>=20
>> I retested it on the latest Linus tree:
>>=20
>> 424280953322cf66314f3ba5e2d1ef345f21c770
>>=20
>> The same bug still reproduces there.
>>=20
>>>>=20
>>>> The reproducer and .config files are here.
>>>> =
https://gist.github.com/shuangpengbai/79c08ada299b3ae37b7a0af292ca413f
>>>>=20
>>>> I'm happy to test debug patches or provide additional information.
>>>>=20
>>>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>>>>=20
>>>> [  102.318332] BUG: KASAN: slab-out-of-bounds in =
select_usb_power_delivery_show (drivers/usb/typec/class.c:1642)
>>>> [  102.319225] Read of size 8 at addr ffff888117d2f2c0 by task =
cat/8378
>>>> [  102.319943] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), =
BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>>>=20
>>> Does this happen on real hardware, or just on emulated hardware?
>>=20
>> I have only reproduced it in QEMU so far, not on real hardware.
>> The repro uses QEMU to emulate the hardware environment needed to =
load the
>> FUSB302/TCPM driver path. I have not tested whether the same issue =
happens on
>> physical hardware.
>>=20
>> Please let me know if any additional information would be helpful.
>=20
> If you could test on real hardware, that would be best.  How do we =
know
> that qemu is actually correct?  :)

Thanks for the clarification, that makes sense.

Unfortunately, I do not have real FUSB302/TCPM hardware available to =
test this
on, so I cannot confirm whether it happens on physical hardware.

> thanks,
>=20
> greg k-h



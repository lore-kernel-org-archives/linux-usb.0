Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EEB30D3F4
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 00:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137951; cv=pass; b=huyWsbw2IxH2cESJ6TFcnAI3ubGnIxaVWu4UOybi8/UKjtVF8jjIqSamzEGej8yb3/VnsAp4Lw3w/x+VboTduK4If+SlgJyA625tBEjYqQB9+KJUAv+ZXeDZpZmbOXwfGCf/x5Nb0olopauvEGX5OBqehX23zqdQF59zcgZtukk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137951; c=relaxed/simple;
	bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9cQpZrhX6jfEckVeFvYAGopBKq6Eb7zlNp6hzYKhsa8khDFw33dl2pq9sM8U7pF9AGjywTewbpfJI/j3BkdA09IWx6LXfbhvoE7I4iDmq7wt3VL9Pft9koqdXd6nWmW048aMR30T4+Wjj22ODPAJiGma95iqNCaovvr9PCoxBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com; spf=pass smtp.mailfrom=divinehawk.com; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=divinehawk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=divinehawk.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2020421077so436399266b.3
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 17:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788137948; cv=none;
        d=google.com; s=arc-20260327;
        b=m/7KIbjvy9Pn+wSCYvqI4711HS2LqurvDbJqs54hFHR8/ERbuZS4JhAh5bpORax6eG
         MTxRgRK2nl9FO3cq89R5CFdv9Dc0u+E0ctmIGzJRx2ctvFEAZ+tqskl5Xprpg5vPW8Zo
         b1rN3P2oK9/FLR1drkLwRgGi2aEDHP5/I/7Na2h5/u3EKZm4ccTS4BImp2GBEL/DOd56
         gEJ214kdnE+/wP8Axw8dUgwvkgHACleQqTaNHwdF5ZFXhptOEJz1rlQntxmKd3Th5L0U
         Kpj1sayUNKqicJ85noswme8jmboShfU/ScKHdhAnK9XoT6jxHdp+oH54o5v7kFr/lufn
         sWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
        fh=Xv6C8lm+2hZaj4Po6qEbAqyd9UZRkIM0+ALI2SyL52o=;
        b=kyRy5aJitnaC3e66YiasChuoqfjJiH1B8FKdrRXEUrgKVMOHWzKMs1qE6QPV3SMU1J
         m1Mn/ks09wA7VPC675JMwDlzPvvz586EDUQaFIVagbw0vbLoB15mxOfeMSbHjeN1Hh/H
         EytjGlphYmXLGxyXmslNN7jdz+gbBbVyc2CTIKH7uREw0FLNriIETSB7o/4+nA7Yp6Ec
         B1EDVnZR9+7DdQB7asUMuvNHJhnnBDz+L3ZygWey6SAwyI87HnPvSvoOdBuS3J7RTGT1
         v8fyVSuMjdbeUbO7EvDYSaIwZdQfGCvVMQFXQdAQFet2Q+MNoJllHGqqpbuiXucQSNYk
         CsBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788137948; x=1788742748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0NPiNRI+HC21r68OCJOYQCoR80z81MkxKVzw6oWvgc=;
        b=H2fG1BB2gga4MQdNqAE1GoES1k5nSY8xGspdyx3lbcLsw+vqsozNau0hUM/Wke7Jqq
         CjpVYCBXcWskGoi3ffvRE6eV03j4lAQUP8QY9YGcoSXEOccJXekPL7mXSC1ecyPZKl5D
         EhUa6Lkedh1L4FQzf1E/vIdak3cPbRvCeQ4BbxjDJs82gzqhi8VIjIVY2aAavOhQmuAW
         b7RQDHy7IgRsjyMVSLNAiIv9Jy0yzAYYUP60DGtCgmG61cIuWw74gu8KqTDuALbbawfn
         IparVX0rrcn8VvUIP8OTJPciS+jDn9uTaHm0mspHbOMCkG2zI7jpHDS9eKcgpq4jFA77
         uWaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAIBgg3jZBPGDi3t7RNFkZXHfqqIk9EMKkNSik+hoe1D2hZPJGPwWaNRmk/NVCgWcgf4gDs1agZUk=@vger.kernel.org
X-Gm-Message-State: AFuF++m4jBFsAEewrzEZHV08Ib79wGY+7njffKb6GN0cI+1K5lx6pFFC
	GUWM6WgClsW2xJHf1xRcP85L8CNrDSSc/iPvRLvwEgHwiN+i2KNeyxHJ91utrctVKLVnTzCse2W
	tcTKYpbgYVY7JGeeZP8n1Fug8nu32PwzOfB48klxL
X-Gm-Gg: AYBFou3uoEutzwjepA4zhWsV6g/cC4YKXUVYf50kBQzjQY2fxsK1RHV3ZhFyBr3hn58
	2Ljk5YS2OKz75dnefbCq8OqYGKPf2eeKmEX+bVeBItWcTWhL2BLy+LfxdFoQ89JxDKwkdATOmmP
	92tCrH66ZKk+uupkkxcIKVTUsHuOfKuOAtwjqflRaua+6whOAuaEtPY0BicZf3EDJxNfvVQ/4yq
	Ld6wNN4BcODtzaWkJGxACq6fkAosdEpUeTQYMwViQBXazogya+G/TTToM6zjo8vInz/DoBHb5ra
	g1KK55fcppyG6rsRvfVUe5U8abt6J2ezmQlf7bEVWJpt5oc2SeAEHoZeVK5I6YQbX5p42ZiMVjC
	IfLZGkkGachYYeU0E9Tty/6rSVDLd8lovbw==
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id
 a640c23a62f3a-c2557423bfemr1484338866b.23.1788137947985; Sun, 30 Aug 2026
 17:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829-xhci-no-soft-retry-v2-0-0efe22f1c2f8@divinehawk.com>
 <20260829-xhci-no-soft-retry-v2-1-0efe22f1c2f8@divinehawk.com> <20260830165934.34e5b82f.michal.pecio@gmail.com>
In-Reply-To: <20260830165934.34e5b82f.michal.pecio@gmail.com>
From: Matt Eaton <linux@divinehawk.com>
Date: Mon, 31 Aug 2026 02:58:55 +0200
X-Gm-Features: AcwNN1Uxrxe2Vm3t8yDU_lGXXkWAxlZ0xh7uDmJiOIsGJhTP-E-y535X0vUdkyw
Message-ID: <CABUBpLf_mA8GmjAn8+-xgz8H5XOvBCr9DRWU8Eqc9=BW9m00Bg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: xhci-plat: add xhci-no-soft-retry-quirk
 device property
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Matt Eaton via B4 Relay <devnull+linux.divinehawk.com@kernel.org>, 
	Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 5:02=E2=80=AFPM Michal Pecio <michal.pecio@gmail.co=
m> wrote:
>
> On Sat, 29 Aug 2026 22:04:10 +0200, Matt Eaton via B4 Relay wrote:
> > From: Matt Eaton <linux@divinehawk.com>
> >
> >
> > xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint com=
mand
> > xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume d=
ead
> > xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
>
> Hi,
>
> Does it still happen in current Linus tree aka upcoming v7.3-rc1?
>
> Similar problem, limited to the specific case of disconnection from the
> root hub, was found on Renesas PCIe controllers (it looked like some
> internal power management interfering with operation). It seems to be
> solved by avoiding Soft Retry on known-disconnected root hub ports.

I applied these (from 7.3-rc1) to my 6.18 kernel and appears to fix the iss=
ue:

commit e3d757dc9257
commit 042aad8d0db6
commit 7e0ef4332ed9

There does not appear to be a need to apply this patchset now. Thanks!

Best regards,
Matt

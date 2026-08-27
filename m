Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CBB48C3E3
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 17:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851891; cv=pass; b=eKMLLrp3KraORCuIyZwVypCAEM69zFWFAuZEZHvf12iQAntcMtGDN+WrDtUAhkxECxlO8zMWs9JGNvKnXa4zzAj5soECyzF37Xoid2CNh6DbOH3chZ9Qw2hDSvdgLDLQgEog1KrXTx+65MnMbtnq0V+X+u3Bc6aNvGxSGHbgOWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851891; c=relaxed/simple;
	bh=fi3xXx9lmMzosKdhDR5Rz7ejkV2wx9RBdSDmpnPGy/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLVbgApnHSrD1tzX1YB7biw3QXJ4gCtGE/1Y9hoUmlpWapQc8uHy3+6QD+vFV3hdtTBeY8OUBGfCmc/dWdHj/eauoQen4Cy6/eSaS8g0+y7RdxMclpc+K47L/v8YCojzAoWgO5evj2WG6Rzbdo6ZRuNjMncjEXcAT6GdS4Ft61E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=jON3D1qh; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="jON3D1qh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso150675a12.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 10:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787851889; cv=none;
        d=google.com; s=arc-20260327;
        b=YXTWX4CgceLaS5DtJ9rnZ9dgS9WJdDNRcVY9u6L1GocxmBTy74kH/yEtIl1d9kEB2d
         3yAY4SEMAwX+ohFUnYlxvt046v9xFhflmmOrPuPu/AavNW7kx7BgtS02y18C4jiOXYqo
         M035WKUWBgYI1Xk4UhPS3CgvpBIxHjqxXeuSvvcqHyJ1AYbGC0rNFxHs2nIhu0lrHh9F
         hzbC77w1uqVSsn4rBxjjtshDGd6d6xjg7entQptxVeCPFI2+rUC+llNeN5oJpRm1ykNx
         NUARyGs/i8HQi+Y9CbA8DGK+kAbBQOadgNxwTcvKBzExUeuPW33R9j+svsX6RBPOYcui
         2Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkgVLt4NrfCVE7i/NEEAS+hRQSbquCyjXQQNoGs7LPU=;
        fh=M6EtqxbPhkZTRnAD888enWBRWhiL26cu5/6Y2P5kJ7E=;
        b=prA8mUMHjrts82Yqgvb6JV7fT2rhEa1+0XBhUwu53vARcHq3hBCam9mXCtbdA4NK6Y
         ndXWrijE02hwwhMDGG4wQPI/6uq6A1cF8CCU74ZI9Bxm1q/jzrngo3UB7hJ0kiHFEN7F
         L9H1OM//9A07NKDGE8TbQJhH9MsWuTGMis9tGCwHlVoR3bCBRKyKfYHm0JR/55pg3nvZ
         gwVx7LsvWbNIfQsezjILSbDbKbx9ws3uucZLyMFF08mIj1pCOcdOKWQKdjWyeIjU80ra
         0VK1A306w7qM0r+9UP8UPRNGgvaMzag6vVZxUqUn9b/aSozuV19gbiztkJOKUVwmxy76
         j+YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1787851889; x=1788456689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkgVLt4NrfCVE7i/NEEAS+hRQSbquCyjXQQNoGs7LPU=;
        b=jON3D1qhVdf0/iNyzFEtCCbR9adPrP+3opOujs0W6rCQhssamMz4m2arjThZYqzDRv
         J5b+raZS5sNUAFLXlYhOrmq9IXNCysRRr/4apVXLhTzsYVvqPVq8QgmGsHGd8fSrbgm9
         L0W5e+9cE6pb3PHxq6PibVUcPjldw0Cl13mAGJuFQJnsGmja9j1w0qJ80yrsSOPsMn7t
         nOCwLE5pm/NJv/MnaN6qeoxWmOW6d2Wlz7fTMpznZX2tWhP0xIDXFpxcVa9m2d0VxRhs
         yya6eZ+Hxmx4y/kuXUqxIQqQsl9QWsrK8m2wBjCQklx1Ps5lhyPNBA1OFwWcpJv5jbzi
         Q1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851889; x=1788456689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkgVLt4NrfCVE7i/NEEAS+hRQSbquCyjXQQNoGs7LPU=;
        b=EzJ05sEp3PnFmML9IlIfxpErVAC7lgm6XliR6hFl7rno15TutFpFyct9BBeRP9TsEM
         SYkaQQJ2rz93hwcIMS3m6xuVL3fl3OlIpWB9NLZetzQIL2t4DBZ5khtVFJyFNzFFgKp+
         P+IgLrnCY3Z8In9uMxmS6Xcjn/sCozcMKVnp356Otdb/rGAgLhvU47aPEfbTXiHXnLFG
         BmZuoCpcNaEcHSsDyj08DANgwI+a+mpnIJxbRp1puPOm6ZLXlDoVjkjpuAKEpkl+HgPD
         FAY2Nrr+MWxj0Qiism+HoyNXvKgsiTTfFMiyPOQOs3mzM9WPmv+gF27cIg9holxw/PfI
         2e3w==
X-Forwarded-Encrypted: i=1; AHgh+RpUcqeFTT4C9gRnse9bB/R2fbSglh4kNHLtFfetAoE5AvZFy4/DPtqzetcfdVdGaHdfOEC7F5jIbco=@vger.kernel.org
X-Gm-Message-State: AFuF++l1j0q7c9gp9F42JwUb8/8LA1Ti5h8EjB4CVDXvdKlhdrVTI4pS
	RGt2p63hP/Ptuny8a2r6RMNRvNScSE7POnhaX0sz3Zf6Z7mz58lBOX+0xkCg49GJGczl9Ye+k9b
	hN1FFWYj3K8cwxCFJ8Sod31vwcr4MMGjnRjQslKQ/
X-Gm-Gg: AR+sD13LNfwM0vXCJFHxN4LRtWZTDdn9vZG1WbBbWuD0eLhg+moiltiG3W8KPGTLLTf
	UqjsdTp5B0TXeH/MPwWaSXHdF0ko5DzHlSLYGjDBRiS7rxeCvOMm+rXId0IberDlR+vgBvNjDD9
	9mw9RnvMF1q3Lg4sDW65aTh2psL2EGFIvBkwaGuxNxBbrQWS5EKCbxiVUY314ps71IcCn99AcdA
	esDxXMuGObdFAHHw0qjQ73ORmHNQK5R+CpBYw8P3cS7qIdWDluTktwugATluVRQ5R5Rb8gnz3vl
	itZgo1WTDr1zgW9WA61rpTPg1IomfCxupGFa2B3BpzwnrFkQKbKLMxWTt3fAwjBg35rkAhDnoim
	AkRWI/IBOLEzYf6zmBeEo7sLS0nxvo6g84+M=
X-Received: by 2002:a05:6a21:3390:b0:3cd:7ba2:e669 with SMTP id
 adf61e73a8af0-3d2686a3386mr834940637.10.1787851889149; Thu, 27 Aug 2026
 10:31:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh> <2026082732-flaccid-overpay-0985@gregkh>
In-Reply-To: <2026082732-flaccid-overpay-0985@gregkh>
From: Xiang Mei <xmei5@asu.edu>
Date: Thu, 27 Aug 2026 10:31:18 -0700
X-Gm-Features: AcwNN1UH6rQHNXhcYdg99UoLIjWRDePA68176IBEWq-kIwPF2BtV8uwj4x4omdw
Message-ID: <CAPpSM+RJKziJf7enrZ5FMy-uxJp1Fy1M_acVXy+v3WskU7jJXw@mail.gmail.com>
Subject: Re: [BUG] drivers/usb: out-of-bounds in xhci_queue_bulk_tx()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: co <co+fd80bc5967eb22c3@bugs.sh>, linux-usb@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Th

On Thu, Aug 27, 2026 at 5:50=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 27, 2026 at 12:43:58PM +0000, co wrote:
> > We found a bug reachable in:
> >
> >     path    drivers/usb/host
> >     crash   out-of-bounds in xhci_queue_bulk_tx()
> >     commit  bd5f485f3f02 ("Merge tag 'soc-arm-7.3' of git://git.kernel.=
org/pub/scm/linux/kernel/git/soc/soc")
> >
> > Config, environment, the sanitizer report and a C reproducer follow.
> >
> > =3D=3D Notes =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >     If you patch the bug based on our artifacts, a tag would be
> >     appreciated:
> >
> > Reported-by: co+fd80bc5967eb22c3@bugs.sh
> >
> >     Everything in this mail is validated by the reproducer below.
> >
> >     We also hold an LLM-generated root-cause analysis and a candidate
> >     patch. The patch passes an A/B test: the same reproducer panics the
> >     unpatched kernel and runs clean on the patched one. Neither has had
> >     human review, so both still require validation before you send or
> >     apply them. Available on:
> >
> >         patch.diff  https://bugs.sh/b/fd80bc5967eb22c3/patch.diff
> >         report.md   https://bugs.sh/b/fd80bc5967eb22c3/report.md
>
> Please validate and ensure that this is correct before sending this to
> us.  No need for us to dig through random web links, right?
>
Thanks for your feedback, Greg.

We are working on making reports public. Sorry for the inconvenience.
We'll stop sending bug reports before we fix the issue.

Xiang

> thanks,
>
> greg k-h
>

Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0F4746D4
	for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 22:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786486280; cv=pass; b=Ct4l6CEZwqtI/0fCpQOR61+ELPYkibl2WyQm1hdU+zcQxD92tVFZmtJavaO861MnvNQSXB4K6W1vXk4GvVHOjHL9QT+nJGDr5Mu6dWyPSrU8UFpI5nyn2gh4CxiMBaOGehI6eXhJpnZ35OG+qQjqLomSwDFLF9C9nnif9CeWBFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786486280; c=relaxed/simple;
	bh=INX9UOZB86iGrf9oBeaKt981k+g+fMt5cKVfd8CueLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7p6gAjQyaW2GOJ5AvIGXY6bn8bxUQXs3Mi9EaOqaI3YzlF410TdXkozVnwczu0BRry4LfYdgw51BrU3A9Bk1xedLJGQacMrkP6VmEqOZBThQxhs5tNwPaTx11ddrM4STTKThclE2wAcf4qKj6rn+PIOlQ5xamajhW9g3SVPOis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=fcspoloz; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="fcspoloz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2055573c8cso54916466b.3
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2026 15:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786486277; cv=none;
        d=google.com; s=arc-20260327;
        b=g04vmPcvxtRA69ge1yug0BoAsoIoZCT4AjdkBP8d64Ox0xRekvd6caReAkYrqpJAVS
         mdw0c1fFLq7ZHZWgtlrHaQLG+M+szLjH01nIAkGBxL3XtBt8jQVvH/XvSkwCLyE59YK9
         Vp0dVdb8+C9uS0prMukAnp4g5YV9w/+8q0SQkE91smGRH53KzsqOnuS3t8562tMzuYfa
         hld52/D0SlybNV3LQo/TuZDqspUpetJjtTlLUHFDvgTGf5+au5qJvh0FMQobwasXRPrQ
         cfXkh/U0xvZeCBYg6v5BUVSoMzyq08jpW+QHQG/V1TtFTBlrU3HLWtKaV1nw/BdTrZMH
         7lpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=juHv84P7DGiHX/hx1EtrLVMVobzjHz+VcU6J93Jq8GE=;
        fh=RVu6Wi+AfO+6iImW02S2aGX8yNZf20EmMhlYj5qC4uM=;
        b=REtPUAo2rgx3RXTJqJCwQcFB96LeXTJmx0qujQaIijW0fyv4X/JJYC8tlmW1hvsVc1
         dL2/3jDe9qkIS2vQzJgqpeeQYwjO0WvN5Ps2nTNOloFuP1opjwLF3nujsIOpB9W4YFQP
         f8uspjxNuatBtbNAqGLvZNqI6ecdevQMirtimKJrDpbCxktSp/f9V+NQgtocm+XJWZNK
         DqFKZT9l2tZWdrx8e04TYWYBf1WjrlfJoNWfFcnHficqFWcoJ0cfHiBD6U5Up7LlbIKr
         OCo8urRqn8PMFnTodDUCKsV/SiHPWSSUlikrsy7fuwcHwpSkUbh7IVEP1sZRWmBvbTjf
         jUdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1786486277; x=1787091077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=juHv84P7DGiHX/hx1EtrLVMVobzjHz+VcU6J93Jq8GE=;
        b=fcspolozDktkfoMrBHjfey8WyVXqnXfQJ5D1OiXXfcBuTHD9z1GOMrhO9g9pnH5j3P
         FOqWxkWJ9PmzsHn4ZwLRWUIcWnwQo1Rd4WV3UangA4vt/nQ7YD/Kp+1pyHEHGiJZrkZW
         eEpl7a34qJULmBi/FjpHdsnzRgc52BJwvGIOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786486277; x=1787091077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=juHv84P7DGiHX/hx1EtrLVMVobzjHz+VcU6J93Jq8GE=;
        b=TavLKsdqz63TH2NFHubIC588t5ANcrdCksqPg4Hy4hi0i9XYSpBnVr0FGZu1/pAI7J
         fpywIIgHF/i5TR/EY+oFYq1HG61MZGMm4ZGsY9VFiIKyRSH1+11wb7S3TOO4d+nV6Lrl
         gdI2hjLVRpqDfGLXg5mv0jJp6Xx+iR2iP8uBtIHsYFFreOg4tFDjleeuFM0hQ1P5LEJC
         ZCoWzSPoN9Exg0V976yzPXTRJ9WEqpMF3CCBWGs6b1xOPGyAs/TQGOohkFxkd/HjSZ+f
         nqlDUMYhokW7JOawMkVpzSX5mdC2vQflrTSilfL/4v6YxqXJcII1EUYGF57qNVkBdbH8
         ihXA==
X-Forwarded-Encrypted: i=1; AHgh+RrXAKxWuoNemox0hrXDzGoun8EnbACJ3CFEhmHPRkRkQWh4L7/ufdokdjDw6NNDUohGfNxGzP3HCCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5SWGdA+KbkVLDOyNG+DG+lhFqo3M3hZxbSFv7VdCJE7D0lFl
	YqqLruf5eLBR8hIeGhUMrSHBNj7lAj+TbfIQ6KFbobwx5teYqzVOEorjSgRvoxg/BK24RdehciY
	rWAolcsWTYro05D+i8rmaR+pMknh18uTdK6+47m8CylkYhD1bU+O9FEbOgw==
X-Gm-Gg: AR+sD10lthaUWoh4UX6klsD3pE4WRlj3xTPFDrjcxpflIFnWuvq2DiVAwEw4s/jX8Sw
	0C/tV1dpDSEteZonm3Jz2LXPK997Fap8IXB5taNEMrYGnrw9nPNDQU8oGi9PFRzXqtUWB8Z8vAq
	BpVNW0sdjajiC1bpuDFoDdGZq860u8/T3BNAxjXyIz8DUs6HI0SoWWJFUmD/cB4shB5kL+lkroC
	4nJPgdb6u9e5qpRs5oFPg3ldfanU+v/qD0hmDF2qUJGoo2ZiTSNaUS8c+g6F6du57/m2pt2ozXi
	vsuDSuciv+BOAWBGsNmf5RmSP4uZADTafNpKeQf+0KcSjoNlw2CEyFzF
X-Received: by 2002:a17:907:7ba5:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c20f2e4e30emr28213866b.6.1786486277504; Tue, 11 Aug 2026
 15:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
 <20260521152715.288995-1-mathias.nyman@linux.intel.com> <20260806101706.72a8de47.michal.pecio@gmail.com>
 <0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com> <20260807000155.2960c741.michal.pecio@gmail.com>
 <e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com> <20260807102604.5f649db2.michal.pecio@gmail.com>
 <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com> <7d514c0c-cb24-4d3f-a9a6-8107cc605bad@rowland.harvard.edu>
 <CA+Df+jdCbY23h+Bq+ehKbJWMvTtwQDAOLk+hw=Y8Ne9zhJ_GOw@mail.gmail.com> <20260807232952.015d380b.michal.pecio@gmail.com>
In-Reply-To: <20260807232952.015d380b.michal.pecio@gmail.com>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Tue, 11 Aug 2026 18:11:06 -0400
X-Gm-Features: AUfX_mx16eaLR3JADG8WIZVqwG8QObz1fDBDJnc3tnZcza70-kLQLhEop30mt8U
Message-ID: <CA+Df+jct3+qG4m=Bv6A6WVu6JiM6Yj96oF=Emes32Q0+q0TWCA@mail.gmail.com>
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 5:29=E2=80=AFPM Michal Pecio wrote:
>    Complicated by the fact that new URBs may be submitted after the
>    underrun occurs but before our IRQ handler learns about it. Those
>    are doomed to execute with some lag (unless unlinked). We could
>    mark them -EXDEV or some such so that drivers don't trust them.

IMO, it would be fine for the URBs that are submitted after the
underrun but before the IRQ handler learns about it to have their
transfers happen discontinuously, as long as they are marked -EXDEV or
similar upon completion. This only applies to URBs submitted from
their own endpoint's completion handler, right?

Any driver establishing a stream must submit more than one URB at
startup. I've often seen discontinuities with the class audio driver
happening with these initial URBs. These would not be detectable from
the completion status because they are not submitted from completion
context. However, perhaps once the non-CFC implementation starts
streams without SIA, a class driver could instead use start_frame
continuity across completions to detect these cases.

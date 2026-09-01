Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F72415F23
	for <linux-usb@vger.kernel.org>; Tue,  1 Sep 2026 02:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788230925; cv=pass; b=Tpk1YH9XygGioNj1sEvCnnmS28HQCLy3NUdKMyg1Eb6sQZeMQiaAGluEJlU+5rLSTGf1qwKsZd3GOtNbimaENVMWXQo94i5nwx9Q+ysVljNSzpWNko7Ys3Hgfbvj1ym2QsrW6HHUxHLIO9Nw/YGiBQjuGwUbZXZrguP2XwtNOlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788230925; c=relaxed/simple;
	bh=d7ifxmrw0KDNa/rU33DZDuRgA8aWneOfmX3kPGUeUC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfhuRfOgkaB5DhpxOGxzXQaHo/hdu7Ehc6hzjhGGX1R1WpdnIAcwOyfuFTTs4tpJIemkHicmrEIUGiSt56iBp46Dtxmx3m22cLUF3zCrnqVHnOcVm/pzqIR7pTYzkUtRWXDpjz5cMmQJh7ATHMEnRwUP0970R3pqWY8NmbmMFhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYveG2ks; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYveG2ks"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso28709705e9.1
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 19:48:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788230919; cv=none;
        d=google.com; s=arc-20260327;
        b=KbNXIC1nHyUfToi9YGphiRjBek3uhR/n7MLhOV/UE0Hpsl4wW5HbImkhIoRzpFFYXm
         KLDxAvD2SX0i5WFhZ2bolcDowsZFou8S89LNrXtVCAy1+0JX2Oypp118Uhf1tMIrqC20
         bdwf1yrodTUclDoHzpc2sJKOuXS8Q2qy98rNinVdE5LxKrNx8F1668e40VYNH4910cun
         3SDAUA1fhzWAlFUQRqHE2ia/T0bMhUfNTevXpwreGPQsLZwqjCCVZ62Ooe4bv4dJHrD/
         igGB+ovxufnt7IvgWsrzDprSu05KwzXfizEfDiybxiCLH9/LI3GpUqu34AA0ciseO9Fl
         E7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KF5a94raY+higffJeqCc50xZOu6d7LMoVpiDSXogvcI=;
        fh=0FFWoDJWdpWkprifJM8s7ouM6ML2NLk43ZiVehQG+KQ=;
        b=bHPc2A2cX8SFL1eAqn1UTCRmlheJOVNohx2dbQxfm2OIUsRObP0wIMnxhcjE7P/AE7
         cX8XyWibiLcHekydND9UAwz05+bCQu/7HMPjaoMLtpajqcF7xo+v+Q72Lx1JRZbktmR5
         ezk6qd31+G7lN9hk7F5c7F1PlC5JHFEolw+Np/h2eZF9bENzuKcVIR71nlblPzssYKTY
         0BcouK9NaWtSKM76HMs8BbBhZYZJK5Mrt65tTY0cnIKpUgmoWHch9XJkV2nMlSVcfbwn
         zpyNRt0NgKKWD1k7kCaJqhAb38ArIIPymnTggUCeiz8WZUlcx2JiaW3tHElVCaevvQDg
         ArRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788230919; x=1788835719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KF5a94raY+higffJeqCc50xZOu6d7LMoVpiDSXogvcI=;
        b=FYveG2ksgTFO1VLoFYOIf3VieZpWlXKVJgDqxWemfi02MbkX299j5H5oaW+zpV8WSi
         bmqRQtFkFDQ8Qvveutco3ljR7KamLPBR7wJMfUlwR6ysFOjrCX6voGuWTEjVm9DN/Up+
         qSwQKXfmSJ7GG1flgUn7OzZI3KRDUnPHjQv1SWRUnp4pilSe2V0O/gGsy3taHLSbBAMf
         UtD7cvfbQrdTgMrcOV3PrstsmYIl91AgKmilQCaCwhnX8XcbZfklZ3dPDPH3vrZqmUlc
         9aOH9wzHpCXh4t+KnR5H9xaMOsC25gSccgtLZV147+lmDBqkT6LosqUkxupOprspSxI4
         MiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788230919; x=1788835719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KF5a94raY+higffJeqCc50xZOu6d7LMoVpiDSXogvcI=;
        b=ZqljRPI/RqOIi4nQrJC9pDhBAM4nXzKJORLjjvRt4ufkZliJSV+YSs9RsocAw+DWiC
         Od9PhADDPn5ZSGQJU1atUYc2UkEUO0jXapLd5K77YbKHeODltdwZpNM3WF9Jyg5dPlU8
         +du6/FoRrzOz7K7FnoG1CeKt96B+mG2UOgKMUsafFvag4ciZFTK16bkN0vsYiCtv6W0D
         FHGzhwhK6q3cjFJrNBdDIlcdWAixvub5REgFq9nCxoASRIpB679EcEvFQDKhAgCtDmsq
         osGcSyOjpwOMsiLcTG8MTJoSLCzNTYH6BHs7+P0HOhc39wpnMNJDgvw5LzPTxEgciuyU
         SVXg==
X-Forwarded-Encrypted: i=1; AHgh+RqW7Pqtk6KVQmtorhF+atgIFqJolhFh5pDgAjfQJN/awsVnW+3Vst41/d/W54Ms6fOS/pnEwe/qVX8=@vger.kernel.org
X-Gm-Message-State: AFuF++k+gE4bt1ub46g9MsweGqM05UhMrCvSBG6m1ICipoZkHDjyfT+y
	3m+ufI0eC+TxB/qaLpoxG5mipZlDNnVONAJ0EMzD9xzwzdY/b0ZBcAzK7D4bZlvrS69HiSKKUe0
	kEkd19e3TrgvNG5RbSL8pJ26d/vGeUw==
X-Gm-Gg: AR+sD13g8qpsprFWIOR27q9n+D1nT61vL1jAZ/2cc3qxvX369ihTZRSLYmsa0Tg3nT7
	XYCGF9iZ0tgaLtjvv2bjlhpqxv1jSGMvOH/aZANo8WrFp6so2Khg6MqFwJ2q7r2ZJBAHMeWQTvA
	bGwI7EZ8rfGT63BaKKTrw/674Xye4z3RJRNXNBmfYxh7XPPcTS9mBuBRMQY8Onnrp0fx7ZNrO/z
	CjDMzhJBPmj7Woy9cNIg5gjigRw9KKDJd4J7/WxDaHxKXa7wfp2viZSqe3NxTsfaT++eiIkUCQM
	gmvZrySr5MYHCJrUpHOsdxFMDnxCOqAoxHD/w0FqMsM=
X-Received: by 2002:a05:600c:4f0e:b0:49b:9433:ea44 with SMTP id
 5b1f17b1804b1-49cdc40ff56mr98080495e9.4.1788230919386; Mon, 31 Aug 2026
 19:48:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812-b4-tb-pending-v3-1-3a292e7194c9@gmail.com> <20260831063932.GB124825@black.igk.intel.com>
In-Reply-To: <20260831063932.GB124825@black.igk.intel.com>
From: old king <fy15309206903@gmail.com>
Date: Tue, 1 Sep 2026 11:48:28 +0900
X-Gm-Features: AcwNN1Uk0rPvBU25g1qvkkJCtcrX_XNdwYeW_UNFlmzX8XUR-jO3qh9AgnAqIn0
Message-ID: <CAMMY3OVeac5h6N7BTsGk-gd20N8BV=vufgLSgqqOCK_76kfnxg@mail.gmail.com>
Subject: Re: [PATCH v3] thunderbolt: Stop waiting on a path pending bit that
 never clears
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Andreas Noever <andreas.noever@gmail.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I moved the constant to switch.c as I don't think it needs to be exposed
> outside. Please check that it still works.

Works. Tested on the two ASM4242 hosts against ae35035da9da, with counters
added to the wait loop locally.

Two runs differing only in how many frames went through the ring first, wit=
h
the Pending Packets bit read back from hop config space right before the
teardown:

  200 frames, bit clear (port5 hop=3D1 pp=3D0):
    0:1: PPTO hop 8: OK in 242 us / 1 reads (budget 500 ms)
    0:5: PPTO hop 1: OK in 262 us / 1 reads (budget 0 ms)

  400 frames, bit latched (port5 hop=3D1 pp=3D1):
    0:1: PPTO hop 8: OK in 243 us / 1 reads (budget 500 ms)
    0:5: PPTO hop 1: TIMEOUT after 584 us / 1 reads (budget 0 ms)

0:5 is the quirked host interface adapter: 0 ms budget, one read either way=
.
A hop that drains still says so on that read, and one that does not answers
-ETIMEDOUT in well under a millisecond instead of burning the timeout. 0:1
is a lane adapter in the same teardown and still gets 500 ms, which is what
shows the constant is applied per adapter from switch.c rather than lost.
The interface goes down in 9 ms.

Same on the other host, with the teardown driven from that end: 0:1 500 ms,
0:5 0 ms and -ETIMEDOUT after 146 us.

Thanks for taking it.

FAN YE

On Mon, Aug 31, 2026 at 3:39=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi,
>
> On Wed, Aug 12, 2026 at 11:42:09AM +0000, Fan Ye via B4 Relay wrote:
> > From: Fan Ye <fy15309206903@gmail.com>
> >
> > __tb_path_deactivate_hop() waits up to 500 ms for a hop's pending bit t=
o
> > read back clear. On an ASMedia ASM4242 host router the host interface
> > adapter latches it once enough frames have gone through the DMA ring an=
d
> > never clears it again: the teardown finds it already set, seconds after
> > the last frame and with the path still up. USB4 v2 table 8-23 has the
> > field read only and zero unless packets belonging to the path are waiti=
ng
> > to be dequeued, so the wait is right and this adapter is not.
> >
> > Make the wait a per-adapter length and quirk those routers to zero, whi=
ch
> > leaves the loop reading the bit exactly once. A hop that does drain sti=
ll
> > says so on that read, and one that does not answers -ETIMEDOUT without
> > burning the timeout: bringing the interface down takes 6 ms where it to=
ok
> > 506.
> >
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Fan Ye <fy15309206903@gmail.com>
>
> I moved the constant to switch.c as I don't think it needs to be exposed
> outside. Please check that it still works.
>
> Applied to thunderbolt.git/next, thanks!

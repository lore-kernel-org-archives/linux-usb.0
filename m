Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682322DE6E3
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 17:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786123855; cv=pass; b=sXx6x2BeWP2zWUsZ2Fc6KQX9v/T3LmCPpy8H1uDyDt1e9C1GqCRBWfTHh9HRVJcdXseDTDnIIUKQTe4RjA2rL+QDx5guDnX40dTGSNyDRrS7GCtHvX9nEISp0TDkNl3iFDcn1rmnr1s3KqjIQl7FjquVqdhTnRaDY9I0vN2OjAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786123855; c=relaxed/simple;
	bh=ChWvNQmhwwiYaCBCnmekdxLbnAhA9/uERbHY8qhrJSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQf2TKrvfeZmhqdwB7Yr5xAVYpNp/EhSSbSJGekBIwqh7VJWB0Olec+5miYOWx7xXQEui1Yj+MrmlJHOXsAYGlaytXvOcVho13T6r35eJXIhuz7KIFdbhFROTfGRqe/b5q+OR6pesws4oEnjTXPyHE32HmL/erxVDVlWi/Vi5Mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=HNAf6CuI; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="HNAf6CuI"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1f5208b38dso631392066b.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 10:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786123852; cv=none;
        d=google.com; s=arc-20260327;
        b=jJbJhgzKiVsZO+esov98ktcxRMV7iBSw4KvY9uzYRFwV91cqkRwsqNV9PStlP5Zujx
         Ctn2K5msujyrqwJcsT0gGeaQj9zZkN1tAa2d0igEV+UMWdcEShiGevrwssozM03iFFEq
         eCWAj/ecuejn7ApyiHiFjkjw3cZKVuKelfQlanCTj7qMr0hZfPCyc9HJ83kKOplKpsM9
         tGT3R3kfZPNeDqRMkFRClVe1j8GClm+YIiTThZjksutHaSAGdmEdxKuBtIf3iIPahGbS
         hjayGJyMZXoVqiYs/L6x7c5GLlM5EZCboluPXm9c2Nlao7sLs4SEiH8muNwxRyujhGlK
         nXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oc3+nnqiiAcR29L47kawfgDAFiH6j+m/tqUDPAT2aMw=;
        fh=tXC8e6bBpKkcy05ZijwafEFxPcTPUmNlbwjUzqWXoOY=;
        b=sqo1PjVHbmHc722XK0Qc8hpeWXZG2DTTdxfHAx8q2pspfXRwVcntw7AWYBuxzKeKKa
         XGVIYujWJesqoHiS9nDwM17YY0KLIUVKeJjkI91nIjuG1zJsk4v3Hb73AwXU90oPBHMp
         ACdFNteOlxH/aQ8Rna8AFfrrQ/yejM6H1pC/o9iu144q39NSDcaGBEaSTj6yluJX+2vX
         zvYf9gi18VqR3QcacpZApZBYmVQMFpFHHScnGCLmh0HEcENejSMWzO0iosmaVGGEtDFo
         SJaytdkHsR7POvVqKO5RkmKVAn7u/uK8pETLepEjoYVA7V6QLVvp5y4QVX18R9jzxwvI
         YtMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1786123852; x=1786728652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oc3+nnqiiAcR29L47kawfgDAFiH6j+m/tqUDPAT2aMw=;
        b=HNAf6CuILvR0x2YKk1ZcyS1fPMnxyhOOcanQ/dU+L03TfLl8gG5Gr4FPHXNkVoVJPj
         cqgaj41DzKFNYWP5T7HsdKFy1qgaiUjB8qH9Xe6LNliXLSVoi0Mm4Nrne19rzFlCZ4fw
         SjDFUj9DwTMz1/BfeCl1zZaXsJnjcSK1R2hGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786123852; x=1786728652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oc3+nnqiiAcR29L47kawfgDAFiH6j+m/tqUDPAT2aMw=;
        b=hDGT6V4dQ5xFzuUV727wo6ajHNQQfkYQZxc4Tt4vBzR0u0wD9lgp7MRssfyGxYasDr
         vctz4cV0UZxgsZlczQehasfi6phQBeeCPn0XxGxsn9j/rGb4hO4MWAteFWEmj4aK0cfD
         wnPwI2bKcJdAmFbPowmuITNbGVaYdX/dUQz3n9gtMkjlOk1GCdCmgaosU+i2V0/cbBEa
         CxhToOg6fQFGy5pB/FEBg+sTqF7QYOShiCrxXzu+okJmZLhmjEQrJZf33Fa51/B/eQ17
         6brTxMoU6gS5pU2ljREWAgv5Efd1Qr+KplJm7xHOSQDPIlpx0s7ylrqPuIMAKfdfxjNv
         cPbw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8H9/A+eQoJhDsxNXXeeLKtWbLHJvjx+eK0JwyoDHL8m81vsZv8qc4niJaN1TQC10pdvqoOcfZoog=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGe6nR2AMOEcGQByi5VLPTYN8bKB0DvDwGpt2q+8wa5PZ60tOG
	q4UqlptS+5rfp3uSRyb1/HAEM6scCnMWDSlOp+EWnV4FUA1Cnxgv4fExB3zfMrm/+uYEuDrAlSF
	MCcCrOYbJsnI0X5sJN/iodu/nygY4PWagSbVWFFr7Nw==
X-Gm-Gg: AR+sD128jrAnXpZ4NCOeKtrJtWfadLAmhLWaBiecZB8y89Jdm3NdEo4tvM4Zb0Q6/kr
	vEeeAyJrGvGsW1OnBTX3JvToXz+dkSckhSJpmuEURT9zSk5Ya8c6qkBz3nMT3uucyS2C2R9LwDU
	lFzq59266mrVkJfbB671FkWd1m2XBOOCVZWJQfHX1pT6OBiojqp+MVVq0EOYnh2lNJoWtAfuGr+
	vfy+Ge3p7b8ZISGVEbO6mWx+DWjKagABDb/K06iUto0NJG7iz2chuShicTqru6o2Os9lajUDQ7j
	+38/66yoj8E2gmfvjLxibVjcEVqLnx7uBa3ms+mOQs+WPQ==
X-Received: by 2002:a17:907:e915:b0:c20:3736:5c42 with SMTP id
 a640c23a62f3a-c2039dfe928mr1134110166b.23.1786123852662; Fri, 07 Aug 2026
 10:30:52 -0700 (PDT)
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
In-Reply-To: <7d514c0c-cb24-4d3f-a9a6-8107cc605bad@rowland.harvard.edu>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Fri, 7 Aug 2026 13:30:40 -0400
X-Gm-Features: AUfX_myg6StRQjl3Dyl4PPTIHdOmLVqHRW1cSZQgLXzY36bo00q5H4d4FElKPUY
Message-ID: <CA+Df+jdCbY23h+Bq+ehKbJWMvTtwQDAOLk+hw=Y8Ne9zhJ_GOw@mail.gmail.com>
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 8:07=E2=80=AFPM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
> With the hardware ep ctx check we will set the frame_id of the late URB t=
o
> point to the past, to the real time it was supposed to be played back.
> xHC hardware will then trigger a 'missed service event' for that TD as it
> was incapable of playing it at the correct time, and then fast forward wi=
th MSE
> until it finds a TD with a frame_id it can play, and play at the correct =
timeslot.
> Here we lost the late data but playback stays in sync, as isoc transfer a=
re
> intended to work.

I want to make sure I'm following along correctly. This is only true
for host controllers that support CFC. On controllers without CFC,
continuations are always submitted with SIA, so the controller can't
reject expired TDs based on their Frame ID.

On Fri, Aug 7, 2026 at 12:48=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
> The point under discussion is really about what happens when an underrun
> occurs by accident -- for example, if the system is temporarily
> overloaded.  In this situation there are two logical choices of action
> if the class driver wants to keep the queue running: Keep the alignment
> of iso_packet_descriptors and (micro)frames as it was, which means
> assigning some new packets to times in the past, or forget about the old
> alignment and start fresh, which means assigning the next packet to the
> next available future time slot.  The URB_ISO_ASAP flag is how the
> driver communicates its choice to the HCD.

How is the first choice realized when the host controller doesn't support C=
FC?

Dylan Robinson

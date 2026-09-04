Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0249EC43
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533187; cv=none; b=kGXh4+0vepgq+CfiXRa6Rum0N4cfglcU1MIpNHLxUXVvIZwbg+Lfp71+5mRUQYjYSGVncti6KXAM9GuNtNX6rTNoKgDd5t5ae95+nmSZSjxAuEWF4mwTQO+wJ83fxpmdX7aLKsYAYOI/zIzT7uOguOxkxtD+ghkC/n6iXkzJzZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533187; c=relaxed/simple;
	bh=Yp8tYgPNpTXxsGy5+609I4e13nmE8B0dM7UajTEg3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O6AunFVCIkUTV7AmGLqeQvtaDGnSmMM6CE/OCGKCVQmQExLqiDhDD8mAzfVBWIM1PE04Yu6Wo1Errbxhk4ApjMi4RskbM0QgCm9QWE5kdmtd+8hnw0FJsEzEWUtjh/nc954xAzqTnjzgCQZtqQsOLEcdmLlp9fkDWXd40Q6dOt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SL6JFF9F; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SL6JFF9F"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so12450755e9.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Sep 2026 07:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533184; x=1789137984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vhyOjz0WA8Xf+6egkRqkIlMgMHYt6yHAudWT2EhHeng=;
        b=SL6JFF9FbCbhl7XSPM2iAz6g+px0se8rMnFhIZCKftFOr3N3ahyj678/VTUAuygI5/
         Wstq0g6y7TXHnvFm18XRtlww1SWc4kj02HtQypjf6WEkSdZvOvz4za8uO0MAcSbxAw8a
         5XODuleKOr7K7venGXbKhPFRwAm1n5pNyP1B9UlyexQ1p91gEbhOI3mohk/RbaXs6R9N
         kwwCk/FrkEpo3l9LSP8obDmQEEtCk4wS4OBhF+Xp8jStWFK8sRiw5PQ60kJbrcyU9SwS
         sHNNU4asUeFlVX0BxaGD8Lbk0cF9f4Z2pml11tUDjz8SfDDkuQiVZqrC5yWKL0jzCUAc
         MVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533184; x=1789137984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyOjz0WA8Xf+6egkRqkIlMgMHYt6yHAudWT2EhHeng=;
        b=Y2s+nBwjCVc0nvhPEBZCgO34fIkqffRJcbBzjjZeOk6BCRhEJ4p0GNkgdiUL0N75F+
         P4lrOn/DMavE2HB8vfxYEr1Qb7KvofXPxoZ9Tvhgu0PZLhWu/RdVWJPIhK8yHE1sA237
         qCUjstq3Yn5WaZT/yLZmUZgyp89AO71DiyOimr9Hks3eHnH13EzDHJKmksM7nyjd9x5Z
         npnUk0zZ3I1a7gaE/MaukWNqyPg3LbbzpsLIBDYNfTORIAJODBz6aHuZbbYX9DsDEUln
         DQTWzHmhOMNeM2fVGlRK9pjyNVJ1j5SlnnC6sHDVmVUaUziXySITEGL9E1y8EfvBJxtd
         9N4w==
X-Forwarded-Encrypted: i=1; AKwUvBwhJ9lfqWctjlaosPeCSrnXSWe1f1/+NIXEL3ldTw2Tt8e41A+qmWywYzSxzgxgjrtbLzGE/958s2M=@vger.kernel.org
X-Gm-Message-State: AFuF++kbXAZbVjuGafxGJv4dfBFdPZ3YUN25bTe5tkbYj6/LHJIOm2IK
	4uSUQcdvDEQZGwbHfPe02DX+U3CK+LvkngEHhgaluJKrsu/gy+N7BaIU
X-Gm-Gg: AYBFou0vLvb6AdMDB+4fnYOaqBOjtV31kcmQXuqlWNoqngHxaOQnAg+DzePHc1Qx7zE
	CeYlctE4mLwbZ1LTnxdPc9ZoY0wANY44qWLiGt3HmxEOOigN2436ti0v9PEjw8qwFJtP1335Mne
	ZEFOoWSCeP+WyXnFTkdHOZrrvEogQvlFizb0RSmZQN6omKACZYnFpNDGC6Nvfa9IPn0JY+wkwiT
	PUzOn0PIhcLz1b7CXSLZkfS+DR+I4f3zFJRrjU+/QCPUNV4nGT3rZpHdZLCFuoISFr6q8tuYCLV
	ALZTdZFNmHcHOdoo3ZaqZncH4ZTwxkKn9ikuDZfiZzHRp1dhv9ef+PuWvUz87GxfoY2/NnnnA+H
	SszwqHhZKsO0HZjaul7E3IGAztnYH2rpCU0nW4b3z3t4/bAkEPCqs6GwBn3a85VDTNhixiRW1yV
	HA7qqE5NXu2jOZuGetA2gqRWXDXzO7VbGCNrZls3afwhmxx2kcmW877Vo=
X-Received: by 2002:a05:600c:c48f:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49cf825d507mr65851075e9.9.1788533183474;
        Fri, 04 Sep 2026 07:46:23 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm10582275e9.4.2026.09.04.07.46.22
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 04 Sep 2026 07:46:23 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:46:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/2] Add larger page size support for USB audio offload
 path
Message-ID: <20260904164616.12abbe13.michal.pecio@gmail.com>
In-Reply-To: <05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
References: <20260824-16k_offload_v1_b4-v1-0-49a6be60ca30@oss.qualcomm.com>
	<20260825094327.606072e9.michal.pecio@gmail.com>
	<25ebe180-a620-4170-92f7-fda6c55a4129@oss.qualcomm.com>
	<0bf654f3-51c5-4555-8cdd-dc9d25dd9f78@oss.qualcomm.com>
	<20260826122552.5761dea2.michal.pecio@gmail.com>
	<05117737-8793-4db9-9815-f617ac085d82@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Aug 2026 14:44:42 +0300, Mathias Nyman wrote:
> On 8/26/26 13:25, Michal Pecio wrote:
> > The part about memory being "owned by the audio DSP" made me wonder
> > if it would be helpful to let offload drivers allocate their own
> > memory and then just dma_map() it for the xHC. No new rings would
> > be allocated for offloaded endpoints when they are enabled, we
> > would point Endpoint Context of the xHC to the sideband ring and
> > leave ep->ring as NULL.
> > 
> > Offload drivers would have full control over memory allocation -
> > size, number of segments (it seems that qc-usb-audio only uses one
> > out of two allocated by xhci-hcd), alignment, anything else.
> > 
> > It would become impossible to offload an endpoint which is already
> > enabled, but is this an issue for anyone?
> > 
> > NULL ep->ring will cause oopses/panics when somebody submits URBs to
> > offloaded endpoints, but I think it wouldn't be a problem otherwise.
> >   
> I have similar thoughts.
> 
> One idea would be to basically let sideband allocate the entire ring
> and set ep->new_ring early. This would tell xhci_endpoint_init() that
> a ring exists and a new one should not be allocated.

Actually, my suggestion was more radical: make the ring NULL for
offloaded endpoints. Driver core would only be concerned with copying
some dequeue pointer to the EP Context, which pointer would only have
meaning to the sideband client, the xHC, and maybe xhci-sideband.

This would be a new special case in xhci_endpoint_init(), but little
other core changes, I think. And yes, it makes sense that sideband
support shouldn't exclude using normal URBs, but they can't both work
at the same time. We can restore normal operation when SB is gone.

> xhci ring allocation would need some refactoring to create helpers
> for sideband to allocate and initialize all the other parts of the
> ring.

Helpers can be exported if clients need them. But it seems existing QC
driver has different idea about segment count (I think it uses one) and
hence it probably also writes its own link TRB and doesn't need ours.

Even segment size - does it need to be equal in QC DSP and xhci-hcd?
Today it is, but one or the other side might want to change it later.

It also seems that QC DSP expects the rings to appear at particular
IOVAs in particular order, so QC driver maps them one by one through
IOMMU. Alternatively, it could map one big block, divide it into rings
as the DSP desires and pass pointers to sideband_create_endpoint().
Looks like less work for the driver.

> This is something that VTIO (xhci spec section 4.25) would also need.
> There an endpoint can be handed over to a secondary DMA ID (second,
> new PCI BDF), that the normal xhci driver can be excluded from  with
> iommu.
> 
> VTIO use case is something like trusted VM accessing a secure usb
> storage device, preventing regular OS running the xhci driver in
> another VM from touching it.
> 
> The secure VM needs to allocate and map the ring to this secondary
> PCI BDF

If I understand correctly, that's something like Qubes OS archicture,
where untrusted VMs run drivers to contain any failures inside. Then it
seems we wouldn't want the xhci-hcd VM to have access to transfer rings
to prevent tampering with protected devices.

Hence, no allocation, no initialization. Only opaque pointers, again.

Regards,
Michal

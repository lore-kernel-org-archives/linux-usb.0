Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873921;
	b=AXGMobJRdxVjPSypmzYfrF0lLYZYQfDTG6kgkskaypZ0ptfg32gJoMW32k5X1VN0VisJ
	 gBPU81JQxEss0oHu6Xb1mPpKcKBTVHZPXZZLZk980PHs+So2RlT5IwFwo728bfZPdOuml
	 mywwl/HgAw5wVMrBwaClWc3BWjoPXCLMtjw8UE01lNOOXCIjAatk5fSDUHTMl6qfv5eL/
	 3HpNRIin85SruafoZL0dc04Ap/ZGhhJbnMvWaQ2iuL75sWXTIsCYZyXHN1ezcd2p4tqNj
	 A/cyqJidInZLSOwBG8QhMo5nWVq+Ax+o5vzUa6C77mNS6zLrwQK/AAiZfXsYQfUL48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
	b=fNRVsMM21sQspH1s+PUWgn8cgw03O9W4N7gAjtcwH5OsKMdjYgV3Stn8XWpgrYIYfCSF
	 N9hwDaZVPeoZnRorN1qyB0ETFb87PvDfiFUH2lg62lGrnRB4JNlAj2/GESmMWazSzgEQ2
	 cyi1258Yh2tjx0kFaUEeGDFsOkxUY65Vd+i5+ppwsYnli5k42/p5jNPzeGMd4EoULWi7E
	 rwbBHGZTRHYslvP/x+iY93uxArSXl9gzv0oiWStKm3tOybfF/P8GGTGzfuI/hbX8pb8FR
	 7kso9RVZOqeoqb6hmiletzRgAOwBoQ8oj0Pyo7Bkp8O6hU9/ieTyKRbwxr0kASOaIJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7C7606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 00:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7C7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9496400270fso262763085a.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 16:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794873920; x=1795478720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=o+1molFffc9e6T9ddIDnNeseSjzEf2bQKujHs4vpOVw4OzSSGS4YQo8BJrSN9kd667
         k9JFBOotGGRYa0PkAFx2E0FiQp1pgsnwgn6pcnUL3Eya4+1ObVIZXwVWtTnGOXsLpAKM
         Qm4w4F5jBIoZdwaJAnrycuNhvr/nMKvlaRPWeoY+KemZwqtCHlIRV3pKlOZAan8ZiPyk
         dg+rWFVtziAEodqueYjujOY8FQIiLOIqi0nCOki4SNuEx/vo4myxz/px2YhfTxnQyYx8
         5SnT2fX1BMMsw9KBqqyDMrnK6kEETUe11lAAN+nPzvpxO9VlnJiaiLVZSGU+NSdcdbag
         q8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873920; x=1795478720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=uP/3+t+tHrXNmoc+y2w1McmOsYkS/Png2vo1cJWm+YSAi6SaVIMZtbsa/BsfFPPeDF
         5Qc7MBncthhK9RJDxT5XTHx67zIDUyJF0Bm/fZTb65LvF/LPC170gQ7QV4G3ee/UoHNg
         hw5wCadQtVlADm29rq2nIvYM5zjvmev1hTPHtCJ7atoX+38HxlFtyjXEZZ74WrIRmS/5
         TBu9uH1ucxuC2u9m5RZFv41fVf+NIERATe/dCrnBUJs8I6jPB0kHrb2eOLCPb68HkTdo
         LaR1nq5tCCugtzJBgLNpveo+pvHayDp7acNk/wjnTjz37VWB0U2u9tSLKGE9z6ZUu5cA
         5V0Q==
X-Forwarded-Encrypted: i=1; AL+hErFDb2uhK+1FB3A7B7iRMBkc8yDDu6IEx4wNHzDPb5SpuPG0PBDsaOUd+rq4C0Bw627fv3ZoFow9HgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ayz9nEqO3Tt+/2fSk8UeeENxnxX9hlTvfCMuzgvXQMh2erUMi
	DcAB5xKiE11HKUxooMZQeSM2SFce/+9IzoGO6mdZtsehzeAJ6fGiQPGJ564maTkzd4U=
X-Gm-Gg: AYBFou1YXNWPyy5ghQGEITrJB4baWpeBU0zahFn61Za62i/AOmDQtDOyx+8E8tPYL8N
	mJ6vbWpOWqbrbJc5zkctcfs/J3/pTqpFLVhOA1O8AB8SUY5yQoUketDQInZ3iREjSpZEnAIum68
	qT2++MiVH9vTo0SlsTnxb8auHcTJS/QNY7rEZwWEnK/VPEFYXZeinyEtp4E5/03n/29ViM3ZApB
	dp05CCjqAu4zrWi3OW7wAxocwo7q3rHx/F3hk9pI8fNlp3V7E7XTl0nA8/T/TPB7RZ/H/UlIiLR
	QWGZVv/615mgJVZBl7zvC/9ryJET8cpfEKjX3ELAM4qiYnqxBpAc5+l/JnMH8Mah597Tk3oN9P2
	DeBvy1NS9gRJLq5WVTUA1hdX9kmcKMiG3GHzkd1+8nDpUN3f/wFS0kPu3OP8P14WqztfxRTzvgX
	zUNw2ZgqQhEk09W0g3hbe0RQYJnitcJhSQAXK0homZinSWGfImjRXziE/FddOVphALJCiWTSeBz
	uBo3IyRT362ZlfHecJB5pDZv530LpmIRXl+cdgMxsHtXi/Kafc3TtOZcK199kzAK7k6MlbECpSL
	2TxubA==
X-Received: by 2002:a05:620a:aa0b:b0:949:7473:b1a5 with SMTP id af79cd13be357-9497473c077mr807892285a.55.1794873920005;
        Mon, 16 Nov 2026 16:05:20 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm969866585a.32.2026.11.16.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:05:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT6h7-0000000Apgy-1pGN;
	Mon, 16 Nov 2026 20:05:05 -0400
Date: Mon, 16 Nov 2026 20:05:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261117000505.GA2488304@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
 <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>

On Mon, Nov 16, 2026 at 05:13:59PM +0000, Robin Murphy wrote:
> Even with the slightly dubious argument that this series only intends to
> shuffle the existing PCI code around rather than fully introduce the generic
> abstraction that it claims to, if the PCI behaviour is still just based on
> propagating the internal "untrusted" flag plus the new global override, both
> of which *are* known at add_device time into the common trust state, then
> there seems little excuse for not doing that up-front so that the new API
> *can* just work as expected.

The desired iommu flow is to start out as blocking and create the
default domain only right before driver binding when we have the
correct trust level.

If we try to do that without this series then we have to do it all the
time, which I'm really scared will break some embedded thing that
expects scanout to work or something like that. My hope was this
becomes opt-in based on the new command line stuff in this series.

On the other hand this series works properly on systems without an
iommu, which is pretty much all CC VMs today.

There are probably around 15 series to complete all of this PCI device
attestation. Without everything it isn't really usable, IMHO. I'm not
that worried about the series ordering.
> > We have two levels: policy - that describes the default of all devices
> > for that bus. level - actual decision on how that device is going to be
> > operated.
> > 
> > "Disabled" prevents driver probing until the device is authorized,
> > "Adversary" permits probing and requests the available protections
> > for operating an untrusted device.
> > 
> > Both need conservative initial IOMMU setup: a disabled device may later
> > be authorized as adversary, and authorization does not rebuild its IOMMU
> > domain.
> 
> Urgh, I can be absolutely certain I'm not the only one who is going to be
> confused this way... I see "disabled" and instinctively take it to mean
> disabling the device_trust *mechanism*, as the logical thing that people
> will reach for in terms of "I don't care what this new thing is, just get it
> out of my way and let my drivers work like they always used to; I want to
> disable the new thing."

Maybe "isolated" is a better word?

Jason

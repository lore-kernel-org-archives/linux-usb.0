Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840359;
	b=mhfs4gHC5/OhAnzNm0Dq96RBXzxS/L8Yp/Pfrhi8m6w2tCgApZUet4UMKachS0t6vICa
	 CbbgCcmehoccKN65HDeQMVHgfK3KqMaISxNj8VmPBVrbOE55oO7BX3/Ja+4wtK9g5u5HX
	 wcKMOoOS37JVm1dnB5ab+ByCiibXjQLqQvV/RNl98GHVIQAQJmjw96EIeGa2c7sgyhuOA
	 t6keB+2mEvSYArEDpBByGkfy9IWjBzNnGnFwJXb9YnoNP1VwZFSJPgiD9MP5hk2vFk0Kj
	 iu15iWLjGp5w6j8bcWkiEJAdrubOdWf81Ycka+8t+OyTZOSceXlC+4molevYr43zhSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
	b=gAMpjM+ByGOrc2wWgUjjq4VvBoktxg1f7khMtQHlloR/1LHdhsDrnq8SuJcoK1OPFHAZ
	 sxnCikTxYZxfu59isiPV0nJ67L2k35bIF7WgcQ1uzcwjG38RvPehyk9EseKOWvGNyke/q
	 ATg8mLN5MJKaxXjEyy4ABkxIch2UbKLRSM0mk6AGn724fsh5JA8tmxwKC7QpK63HuJmY+
	 owfBnHU37tdc3xlxhAv+GihZ22ZS8R/3yEPuFxNnIu9jvBytkZFR/DHvxxj9HK8OVuyQ/
	 KjiadHcjwrh/ZM1BBztgIAvVlQYFnoB41E9DsaTpGA1+jQiJmt4yivdVeSoaIPbE21A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9991A606A33A
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9991A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-949589c1495so290257685a.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840358; x=1795445158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=dLdJyonbx/GT9GciisxRrbnKJNPmXRO37SMr0DcL0fOWPt4npP7q6oSEFPRBxyhYBG
         VwQv88je59xwJGF1tzvO02VHIK2UoI2gFnHM+RoqxVUasg9DyQA32ToeKqV0tOS8H2/F
         utZ+RQHXMciPdHoqR96pmDBV9oFbAflIPtcSFhX2+r9dDE0rLhaGZCPsZ1j517doL9zB
         RpfAbapy98a71EK1akS809jjM1beUX7TmDUaCrtYNcz/JJbJ2sGjj2UfCKl0NoQ68uWW
         NnufbW7FWZvXAJBZh4GXQ7J60xB7eIn/T76+zn9Pq4vvTPBJTSoxoiKRgL0R3QgrjVbx
         3mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840358; x=1795445158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=fATxqs1FRnoQtMpTQn4gwBnyQLWg4/6IKkNoVwizS7KpVpiq5u0O33KYu1Nul1iAGP
         0gbJn4k6u3QFzcMHJ4KOFG1JbFwF8Q5hBoFAWgV7nP9y6iYwgxz5938ePw2d7MdLHVYs
         XnUXBQEkKlBmnNo1SAR9kLWBugcqwgOo2TrwRNeQYrJsqxQ3JZdpGPoxFuJMw1f1cJ5x
         3T0s1tHUyoftuIqYDYdjd4VllZNHr0uU0c1zbCWxV2A6MVNKIQwYW6/YN23kRjDd5Ma7
         J/ih+z4rUso9uZfGI24PGxl/m/2to8/t+AoQPkh5wbm0KWPHEoZSII0PJytDcyY66a3N
         uCBQ==
X-Forwarded-Encrypted: i=1; AL+hErFvNt0gS7haJc9cuYU19kmC7zuzWoRYGftbzSjpEHDC/qkEIcbhl8Qw1OaZL4hoS5yl/z/GnQHZ61A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lrWB9yy9HFFoqBPJi3XOYw8dbbuH5zkoQX9P0v956imrEFSqs
	fiB8pBURxhUpcqK83zudEpxzhvKL1h8MD+rYD+nABeZJ+3dYdd9hJnyZAoRVM3seSCc=
X-Gm-Gg: AYBFou2t52tleknbxPKoHe+XRJvfk0VdjBSHT0jeWZKg17QfeFbA7FtwQ7u7LNKcZta
	HR+ZFKSq6+Krp7ukgm3KlzVXUj4K/3TxGh0tZVMbq2isGZAA6b7wqtWMw3rTP/QpWBB8PXMfjUF
	yijQhKpf5OJzRFAVo1iUGpLvc3ec4SSY8EqFIj58mQThk2jZBLKWjjyLgvIoFnbTyGdLlIKUhnb
	RVc68XDMaGF6x/4oxu2BxkYzT6C1DBt6E96fK2y/X92AyafX8AQVQGpuIh/eOS8QtITi+CEPzOe
	vsmarXDZxaPtEz1sUwRda0jlq0GC0WuX1Gxfm03PJV96QgvG2qvixnv2751xUCA3BwnidOdTcJh
	Y40kltFrVXGLTQJbvLQ/tY45QuCSX/7FBidtxN30Pm++S/zYOmGi/WT+D35YFinxmVFbrEvnQCc
	RHdyp8eurREopcPZG6YUxHxQmgG3Vbkw+Bfzv2h6OpJ8ycGQ3mzx2+/hJLnensNts78xh+ki+aY
	Q33iYaNiapUJParJGHrXbVJSuJkxJ5NQBVk6wjoCNVLE7s07ImUWvmY8xKhyzXIDAPyCD9SSaee
	3uhPDg==
X-Received: by 2002:a05:620a:a41a:20b0:949:5872:be1b with SMTP id af79cd13be357-9495872d3c0mr1015844485a.39.1794840357475;
        Mon, 16 Nov 2026 06:45:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm858473985a.18.2026.11.16.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:45:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxxz-00000009V73-1sJy;
	Mon, 16 Nov 2026 10:45:55 -0400
Date: Mon, 16 Nov 2026 10:45:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
	Robin Murphy <robin.murphy@arm.com>,
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116144555.GM2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <20261116144103.GU11319@unreal>
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
In-Reply-To: <20261116144103.GU11319@unreal>

On Mon, Nov 16, 2026 at 04:41:03PM +0200, Leon Romanovsky wrote:
> > I think it should only be for the duration of a bound driver?
> 
> For now, I decided to disallow state changes because the IOMMU may outlive the
> bound device. Unbinding does not fully reset the device, so we must quiesce it
> to ensure complete security.

When we refine the lifecycle for the iommu this issue should go away
too

Jason

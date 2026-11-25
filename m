Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795619189;
	b=aa5noNAiWqWzowiBzaOrF7+XGJlBc9pIc5kysUP+rkVwrhAIepvSh1LwXGP3mQzB6/5g
	 ay4MLmlw0a7gjWQFuRt/york4alr+j3ZniUg8K3+0LLiBTPxY23zhihjQSh9i76+TuKKP
	 2/Z9Ed6iM5L/gSW47JWVsbU7vXFOvYJSGnfBPJz9uDA+jEJl53Z/F4ykzHTDKfeYbdNQT
	 pT8imsXiY7kiXXxXRQsmhjocvL4Fd7dufYoJabYfZG5xQodp8tKiphPJKjtEMCBZFseIt
	 U24xdNmbDDtNNILXT3NMkiBlw09MPe+pE3eGw0Zcdcb3ea3L8W/3wkmsAnus9PIGo6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795619189;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=PBfUJMvdp1Zgdhs8q8UlzbfaO4JeJJa8lPNEJ82oZcI=;
	b=jGDmg4CaakDE2dXJqC6cPjg6sNoxk6cD066k8M13SwxyB9MrnGkdOVKkcjIG3E2ehCar
	 onE3INLZNNX5ihSqxU+MVqq9A7Fns46FuYWrYUr7EVEF8c/mvKbMAzZk380BVwZ43hM0W
	 yw9myPMfsmgNZ4akuwWvx7o3DGmpmLRfwaNi0pKtcZEheWSxUIBtwHnIdOoUmZvO4hbGa
	 nTlIzqe6Ze+EEnSQXbku2h4dUIT7PfjGABev5osW0BVJmWvpawBVA9D7lEGAjZpeHHsfA
	 ejU4bpGYI8zyg6a3zGGsYmuKto95Ox6D/edAljGMSamxK7lKc2usZ2UmnVGi0AEBEhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3ieUhgD;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04E606A323;
	Wed, 25 Nov 2026 15:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F04E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=R3ieUhgD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795619188; x=1827155188;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yizFP/bO5VWvDoobNH8pDEY0FcC9RrW/mVnpWQ9eZHw=;
  b=R3ieUhgDVZrai+orD9zDFBKNr7yJRR57ZJgssXmFX3l+YyAvkZ6gG1GB
   3jRcw9DJqMuQ2LzYI4jH7xA3rGFdNdxQ0m3DzibYWfCDX26xZ5Idd3JBS
   B1kOg9bv8DZrpMxsGNv6BT9c8YAhQRgs/jt7Bp5HlSMVgvOOi/bw3j5zV
   1IM6Hsqhz/wBiH7IpoifmgdvDKzcaUFn9eUWMZKqZ2ertc4deHEXnM7UV
   fv4HYr9sZ2zfaX26vQrLjBou4FQ6wCyJdp8fOsCuCFjzezlmrU61pRQF4
   IcEsW5JNFPBQcI9oD+VFS0ZTnCLDY4r6kA0GBE0U14hJ3QKrYzodBNDfu
   Q==;
X-CSE-ConnectionGUID: tHMbFtEoTSeI7yR9Us/GiA==
X-CSE-MsgGUID: 9wOtup4rS3merMe4qKU8ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4359617"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4359617"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 06:52:11 -0800
X-CSE-ConnectionGUID: iNuhGpGiS3On5k/MD3M5MQ==
X-CSE-MsgGUID: bijc1W1MRvuAsI8aaGeApQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12172389"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2026 06:52:09 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BFF2898; Wed, 25 Nov 2026 15:52:07 +0100 (CET)
Date: Wed, 25 Nov 2026 15:52:07 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tobias Heath <heathtobias@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Sukhdeep Singh <sukhdeeps@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
Message-ID: <20261125145207.GH191152@black.igk.intel.com>
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
 <20261125132228.GE191152@black.igk.intel.com>
 <a08cb3e1-10a0-4a35-9258-cd510b91985e@gmail.com>
 <20261125143531.GG191152@black.igk.intel.com>
 <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e87af01-02a8-4714-827a-62c5beb6f4e4@gmail.com>

Hi,

On Wed, Nov 25, 2026 at 02:42:58PM +0000, Tobias Heath wrote:
> Mika,
> 
> Because s2idle is Linux's path to Modern Standby — "look off / wake instant
> / state preserved". From ACPI's perspective the system never leaves S0
> during s2idle; the tb_suspend_noirq callback fires anyway because Linux's PM
> core runs the full suspend chain on every s2idle. That's the mismatch I'm
> trying to address: the ACPI state says "we're idle in S0", but the TB driver
> treats the event as a real suspend and tears down the fabric.

Ah got it. So no it's not the same as Windows. In Linux there are two ways
you can get to the S0ix and you are after the second one. First is what you
are doing now, that's suspend-to-idle and it is pretty much the same as Sx
is except that the OS idles the CPUs and is in full control. All the
devices (not just TB) go through a full suspend/resume cycle (typically).

Then there is the MS equivalent that happens when the system is running and
is sufficiently idle. All the "important" devices like graphics are runtime
suspended (screen is blank) then the system automatically enters S0ix due
to the same mechanism, CPUs are idled. This is what you want I think.

For that you need to look that you have all the drivers loaded and the
necessary firmwares and there is at least on Intel debugfs files under
pmc_core that show what is needed and what states actually are entered.

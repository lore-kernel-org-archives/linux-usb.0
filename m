Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DE3A1B5;
	Wed, 24 Jun 2026 10:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298682; cv=none; b=ChKmf9plkzfO6/ViWK7llIlxZDFpnjqzNVf4alLDWdUkSam0ZG5ZQTrYpfMR+jTN41jofp7tmJ5PxUMvUQDq382wrp/L/JN8fzXy2YMAfnsUkORJD9soyDAC6Ri50ckSzRCdDOH20TuBYLT0dy1AiOj2Qfmxavs36o9Ra2pR23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298682; c=relaxed/simple;
	bh=xfiVJXkNfw1spXDRgHatsV/aIUpjIbzmJtt0xI6c2Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtHZuJ62lkXff+o900tqog15TXqF5X2zokUAnvUmU5+nhQxZPVxR6Fosbn4KneWKiJ+FJCRbSgtFT8o6z2kMO0bPvwXWtTzHFeKnBtOZ7puFmoQDwDH67fPV+cKIK56hcyW92DFbwfjEvvegfwRZy2hx2i2oRKBv0H96AYiF4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HalWHlm1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HalWHlm1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782298682; x=1813834682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=xfiVJXkNfw1spXDRgHatsV/aIUpjIbzmJtt0xI6c2Gg=;
  b=HalWHlm1MFr0YTPBgjkZT7CiEjzc/NLvSU7WFHPnZ/N0nnusATLhtncP
   bWLlQWcM5e1z2PdAP2wEpq3voOQ6QFp+eVJf4oEOsLUGlC+l7Z0D8AyXA
   e5LjH15fceEq5orydkW3XVSqBa8xCRnkMs7D4rJd3raHojt/B712zf3Aw
   LE35pmo8Uuua+mDFNS0khXOb3tsgyfm2n5Lk++uNr7IJDVy6jyJ6HbqNR
   Oqs4O/F9YVNTbfRGPIUs/d1RdFSkrc5sgjq7kCm9QrMVxDyg/taehedM1
   8clb65SzJx7OX0LjXMc3HCqSxn6ayELD3XNqFgE0mXdSYPtZa+9dxj8EZ
   A==;
X-CSE-ConnectionGUID: Ve925WXVR8Wo/6S3BQ9uHQ==
X-CSE-MsgGUID: xGy/6f9lRQWNRXVhNCMStA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="83060661"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="83060661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 03:58:01 -0700
X-CSE-ConnectionGUID: V12GY4fvRGGsM1wEJOY7jw==
X-CSE-MsgGUID: GFPNuM0VTAycKGMXQk6c4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; 
   d="scan'208";a="246902727"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Jun 2026 03:57:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 53C7C95; Wed, 24 Jun 2026 12:57:58 +0200 (CEST)
Date: Wed, 24 Jun 2026 13:57:56 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: Add helper to check cable altmode
 support
Message-ID: <aju4NGd84VRyvQer@kuha>
References: <20260622093910.1210089-1-akuchynski@chromium.org>
 <20260622093910.1210089-2-akuchynski@chromium.org>
 <ajkMCz52lkq9hz3s@kuha>
 <CAMMMRMf0kLTJeVztQwDsz8Zm4wBXX52agNpvnKttkFqupQX=4w@mail.gmail.com>
 <ajpEG7ryQi8im7U-@kuha>
 <CAMMMRMcAkhbyJ0F+a_C6QSmG5AxB3UpDPZt70sXoit8iQW3XOQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMMRMcAkhbyJ0F+a_C6QSmG5AxB3UpDPZt70sXoit8iQW3XOQ@mail.gmail.com>

On Tue, Jun 23, 2026 at 05:34:16PM +0200, Andrei Kuchynski wrote:
>  if you are not against it
> 
> On Tue, Jun 23, 2026 at 10:30 AM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > One day and I'm completely confused again :). I opened the code for
> > myself (not compiled) to get the idea again. Please consider that, or
> > something like it - the important part for me is the enum. The enum
> > does not cost that many lines, but it does make the idea more clear,
> > at least for me.
> >
> 
> Thank you for such a detailed look.
> The code not only compiles, but it actually works as expected)
> 
> >         case IDH_PTYPE_PCABLE:
> >                 if (speed == CABLE_USB2_ONLY)
> >                         return CABLE_NOT_SUPPORTED;
> >                 break;
> 
> With one change: `return CABLE_SUPPORTED;` instead of `break` here.
> 
> So, the enum and the wrapper are in V3.
> If you don't mind, I'll add you to the "Co-Developers" list.

Okay, though I'm not sure that's necessary.

thanks,

-- 
heikki

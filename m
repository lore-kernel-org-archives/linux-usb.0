Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75A4334C2;
	Fri, 24 Jul 2026 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784900264; cv=none; b=YdG6tplKWF2SqTXWaCin7zookx340PAQU8kmUzi+N3HBNgSqdhCfdnKDXCosrNRX5XR/Kn7qGDRm0zhgMiohDhrP2ORy6tknHL0qlAUgcgTQrcikPgz9pCIrga34dZFma7T8pmz3b09J04VJzSBeBB1ngh11e5IuAIvU/tD06xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784900264; c=relaxed/simple;
	bh=770I95pX+tPgVJ9X4tgTI4sHljFNk62iQnForpYpNEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c14nGBIJK4G7wplP+PPlI+YzHXpvp7/q2kD/X2j7lPMyomYjuik1j1p9TBpyulyB1XTHhF53gqoM9iNM2PfbzjS9xJ2oa2XM1XJaRRVTvLc3G0Yv2g7d8GEiK6w7zEWw5wI92as89eYZgOoGDb2w1nrMN1YscWWHWlBxeoFOF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n286uWV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n286uWV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDEEF1F000E9;
	Fri, 24 Jul 2026 13:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784900261;
	bh=ThOLRUw2kHNoH1dK2q+nIV3YJOGNPK/OgjhZVbewvcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n286uWV/MOE3R3sXmlbPiT3SLq2/gSb9xsneNaKUVELIYef869189g1KPJA5+8uSU
	 Z5xlAeZGJtnpwcBDXBzlVBAvtmjHZWFocwDGxzWE2v0+QFkdk3uyKJg6oKNTMh2agg
	 9PRLQN6kVxk+zLxePfeF/JCS2S4M1hsPkdYkNxXU=
Date: Fri, 24 Jul 2026 15:37:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.2-rc4
Message-ID: <2026072408-creative-surfboard-df2c@gregkh>
References: <amNORpUte3CZ8LbQ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amNORpUte3CZ8LbQ@hovoldconsulting.com>

On Fri, Jul 24, 2026 at 01:36:38PM +0200, Johan Hovold wrote:
> The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:
> 
>   Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc4

Pulled and pushed out, thanks

greg k-h

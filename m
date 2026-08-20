Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28F737C90E;
	Thu, 20 Aug 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787238514; cv=none; b=D0Y55F6qMitX7kzZWMHnER/ZpfgpJ3DdfwocxHX6ms8uyZFQMAfAN+4ZBe6uHMFSaOqVf9N2j0+NF1S3ZWKk/WQ2xjBGXsyTg6GQhUgWeQP+MedEh0eO1LZddbPV2Jf0Q8uhuZ+74LMlW3ypm8FVvZnnyFBCz9j04d4YW6M5KII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787238514; c=relaxed/simple;
	bh=GCtoSaXf5BLBPYLRSt4Fq8npLEdX2lX6zMpQZXHkwVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9GwbRQcK5b928aZ76VbXUJNTFHbUlW4hB5Lg1YChx6gmkKo0bKkVPAzLCchubLrhcP4tpFs48tE7AZfsaFXvbnc7Mrgjja0VEN3ymx6Kr35+nAc6pjSM2w5ze27y5A0OtzhQ3IbpVAldLHhkCE+PxSWR7XyZBk7U5mbSG3T1es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vaBfye+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vaBfye+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E68B1F000E9;
	Thu, 20 Aug 2026 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787238513;
	bh=cJ2A9sZXf+jRowYFAMzV6zLXynSkVEUAI4pjz9Wv0zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vaBfye+97ekkPx225FdONye84ALKmSFowpWR16TT7eQUHxJmk+WZ1Lj4+y9kE9Byp
	 7X8jrdm3t+sswObkzgwDSkHM/POpfI+fiFPGai8oXiV8nZPtGv6gIKxld84MbZuiSr
	 gSZNLtEdA0EDw+SctWwGM6aMOIYOYvwPmRyXXh7c=
Date: Thu, 20 Aug 2026 17:08:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] USB: serial: fix port tear down use-after-free
Message-ID: <2026082018-fringe-stump-711e@gregkh>
References: <20260820145402.434447-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820145402.434447-1-johan@kernel.org>

On Thu, Aug 20, 2026 at 04:54:00PM +0200, Johan Hovold wrote:
> When addressing a port probe ordering issue in digi_acceleport recently
> I realised that we have a corresponding general problem during
> disconnect, but I didn't have time to address it straight away.
> 
> Now syzbot has managed to trigger one of its symptoms and people have
> already started submitting incomplete band-aids so here is a proper
> fix.
> 
> When testing the fix I also noticed that we have an ordering issue when
> deregistering drivers that can result in similar use-after-free.

Nice catch:


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

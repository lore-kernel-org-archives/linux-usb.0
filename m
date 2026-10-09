Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C14BFE6D
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543039; cv=none; b=E83DKaoE6GyWmtmP5ecVVcIttQhILKsailZM2hk5I8KHePR0Cd7MBDi8FO+utpQfyUk+6kAHDZdHrSTIXkXmazKLbLoroCx2/TpivXQSzA+QZXLWbz/ZrRXXgG5tySuQkD+KABXYDN0+IEYIUdiJYE9QDM/Wl/VmsAtcFGeGJ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543039; c=relaxed/simple;
	bh=NCTKmU4ZceH6EG/jL6exde9Uv3VL9t1Pw+SzB+OhaNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3a4i4Gz88wrMMZSLABWBZkcwQVld0v9URlBA2u319t5tMfjGrYGwMhb2WfTdpKOnFRPKhCPEdzC0KqQ0v8pj91i8h1sCC9yeUS4Cb0R4zZdq5AZhEJ0KAzIvaIDbfK8IzWV2+ajNSyDksrMU0muv2Tn3UJpAAkNNHhXVbefC7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OdSGLO2F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OdSGLO2F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4CDD1F000FF;
	Fri,  9 Oct 2026 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791543031;
	bh=/z8Ns6inl44QvL5SQNWJaAjly7SH/KjwCcKWXV+i0lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OdSGLO2FU3Jl/lc3w2dqArXoOfoslrEon5eEWELDmbX8aIrk/33J946z0dS6nJcjf
	 eHuAhGHjXgMgOwOXXu/XI+C7EOxw32E0rVuJTdYdp/aoK4x/j865U0A7n1DZIfJMtE
	 yzCaFCt518kvLvr06wizHMBDnM0C72ePWGIix1e4=
Date: Fri, 9 Oct 2026 12:50:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/14] xhci features and fixes for usb-next
Message-ID: <2026100935-recreate-finer-714b@gregkh>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009095834.561578-1-mathias.nyman@linux.intel.com>

On Fri, Oct 09, 2026 at 12:58:20PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> xhci improvements and non-urgent fixes for usb-next.
> 
> One series by Michal to improve transfer event handling, otherwise
> smaller scattered patches for dbc, early dbc, sideband and generic
> xhci cleanups.

You you want me to take all the ones here that were "clean" from the
sashiko review, and ignore the ones that were not, or do you want me to
take them all now and those issues (if they are real, at least one I
noticed is not), will be worried about later?

thanks,

greg k-h

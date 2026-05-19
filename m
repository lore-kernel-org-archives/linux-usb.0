Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98CA3FE37A;
	Tue, 19 May 2026 09:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183028; cv=none; b=g0Z3P1kuve40ehMGZIJ1+mqmG+ZHV/W8Uyi7zc7DqE8YLflJ5qysToAhCnDLSWu/Uc9q+PvVREQF9wPfZoYGdTbycqUTvK6DC67U/Ly/onIkvLjX9CEpXCUkcRVDRTxXtbhLpO5SDImgd43BPfkLq+OlRkS2FQT4DLTCP1wZyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183028; c=relaxed/simple;
	bh=Dmx2AerPEKqAl74yQQNaebhJsKvHV3Xzvlpb2UCZdEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgmkhWVtfTcQMvArXdwVkxJH8VCz3+XAnY6XsfKmce6LW+OVHTPrlKyKqT2nzVVVNh5YwDXQ47Fc3iWbjbdkfexw6U28ttpPVUsl8PCOo+ncKVgRGC/1IncjTVPWlPSihQXj3UZ+7DNN97aglUkd/M28MgknMJf050nf3jt3n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=slDRfu3H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="slDRfu3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C51C2BCB3;
	Tue, 19 May 2026 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779183028;
	bh=Dmx2AerPEKqAl74yQQNaebhJsKvHV3Xzvlpb2UCZdEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=slDRfu3HRn8e6xbA1osAb+1PQp06roJRh6XSXSmHDEg4wpvZBJ6/kvfR2rutPwAW+
	 eJgUt8FARvdy2zvTRULSZHdf06Iao+A37kjh5evjA2LVPik3tIZv2fAKp/w3NNWo/L
	 szybv8eDPKaFZYFa3A71FASf166V6eXZB2T3GnJs=
Date: Tue, 19 May 2026 11:29:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [stable 6.6.y] commit e613904fa419 causes suspend regression
Message-ID: <2026051926-bunt-manifesto-6b92@gregkh>
References: <agvqqMt9x0df-WXS@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agvqqMt9x0df-WXS@google.com>

On Tue, May 19, 2026 at 01:51:22PM +0900, Sergey Senozhatsky wrote:
> Hi,
> 
> We've identified 6.6.y stable commit e613904fa419 (usb: typec: ucsi:
> Update power_supply on power role change) (commit 7616f006db07017 upstream)
> as a root-cause of suspend failures on some of our laptops.  It seems
> that ucsi_port_psy_changed() causes:
> 
> [  309.858915] PM: last active wakeup source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> [  309.858917] PM: PM: Last active Wakeup Source: ucsi-source-psy-cros_ec_ucsi.3.auto2
> 
> which prevent laptop from entering suspend.  Reverting the commit in
> question fixes the issue.
> 

Ok, and what should we do?  Is this issue also in 7.0.y?

thanks,

greg k-h

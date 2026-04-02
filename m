Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54D43009CB
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136961; cv=none; b=CoSaufGJDd8Xdd5wPA7kfG2M0v4ly8Gqr9cNs6CKGzSSpckYv5X9+qsvaHxFfSQhgdcw7eMeD1W/20MMEPgggLSic2RObAJT0g1DddPqjODUH7DrfAsGtaID/5HX/0a6wbdDfpcqVszjh+oDwOFZN5DzPQzsWMSTB9tza0eG4iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136961; c=relaxed/simple;
	bh=YNrNl4YBPyEfXiBH0OJALN7xeS+Ganb9hN/L/xhT1qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/vcvBuofI+e3Pr133aPJaTnDn9pJLD3GOZ17JL5a5MezO0enSmmQ8nna+XevWYm37L5Kuiwpjem5H/okC5uEizzvi6wa1m7SzZsNn2Yx7zlE7NUNqdw0iaLSxWfG6qQ85O+HeUOhlv3V27Gws3G/VENLbuVEMwqly8BdF8cpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ewm+APFK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ewm+APFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010B5C19423;
	Thu,  2 Apr 2026 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775136961;
	bh=YNrNl4YBPyEfXiBH0OJALN7xeS+Ganb9hN/L/xhT1qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ewm+APFKDkuPIegBzc17TzcRdnSSj+kgaHgtqXLH56uS5ICJXpQUm9WSfrFEQBb2f
	 XHcz3eMO/Y9pSQnm3MsbZGydumsC7G9Abf6EFzDAzOxKq+FfPVwohdoH/LXst06A/F
	 usvDLMblVmFprtpPpLlJUXTcPzgi5umq0naOuKB0=
Date: Thu, 2 Apr 2026 15:35:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Fran=E7ois?= Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
Message-ID: <2026040228-jellied-glamorous-adcb@gregkh>
References: <20260402120433.22967-1-francois@scala.name>
 <2026040254-exposure-stubbly-7239@gregkh>
 <4502b982-277f-4b96-85f6-55e6d5f4417a@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4502b982-277f-4b96-85f6-55e6d5f4417a@scala.name>

On Thu, Apr 02, 2026 at 02:27:13PM +0200, François Scala wrote:
> 
> On 02/04/2026 14.18, Greg KH wrote:
> > And what commit id does this fix?
> 
> The altmode struct was added in commit
> 8a37d87d72f0c69f837229c04d2fcd7117ea57e7

Great, when you resend this, and properly add all of the needed
maintainers that scripts/get_maintainer.pl tells you to add, can you add
the correct "Fixes:" tag line as well?

thanks,

greg k-h

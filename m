Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477C34B1B4;
	Tue, 10 Mar 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773131737; cv=none; b=fg7NhfqAqdD7ef3y/JTsqKrsdbciP3nmgpsJAe96xjJel9U4+KPnr6Fd5JvNN/QbyDvxW0SXGWiJvoOzyi+YbqqJ7gL0LMOHcfCsjE1N8caWQ/NthQhr6SZ8yiThVxf8EbLwoPe2oMFdEQ0N683tVUki2NtG0n9feQdK9UimEBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773131737; c=relaxed/simple;
	bh=L0E3w9zz9+3G8d3U3XT56Z/e+omxT2atQ1a1ORBmC9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pm6/+97lKmHgxniZ5rn9IoXfaMLJyZ5EXRJARUNX6QLmj6FZZyknpXYQ4Bvpw9NKa63knd4vS5zOW3YxVZLg4+mMxl+ctSsdnKrNd0u7Z8APDIhqAICb39yBR7CENbrQMkDd+MkAscPBEptpQLbLduIIgXSNmSRb6WzRZE+Pa8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHl2akS4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHl2akS4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE16FC19423;
	Tue, 10 Mar 2026 08:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773131736;
	bh=L0E3w9zz9+3G8d3U3XT56Z/e+omxT2atQ1a1ORBmC9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kHl2akS4R4fI7YPDFd2wfPm8OTyt8Bo873UETN0N7azbsQNkRrTMEfX2myfCAyNeM
	 eqkqJqd0ppQa+s2V7i0jTbcnQKCsLWjivKCi/YU8nsHHvUP69cCxfBq2grgdjiVzUb
	 3J8Mf+IwtDxPu4PL3FQ2wp3nvOYxNiIQofIuHuehxMqW71mpYlhZpQ/XupTaoB0lxt
	 n6LH6NO/U9GNiDHPKkbI00JRsEFsBMbGoiv+Q+W//Y7alz5uAZBIIHMBg9VtWkaF/e
	 eYTQy48sr38ulLegRnJSxi116IGacC40t8ezmf6Gl9e6MoZ85+NSaI0JXdilmNS830
	 iCA879NXkkrjQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vzsYw-000000006ic-12mM;
	Tue, 10 Mar 2026 09:35:34 +0100
Date: Tue, 10 Mar 2026 09:35:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bastien Nocera <hadess@hadess.net>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: usbip: drop redundant device reference
Message-ID: <aa_X1qNsCGll04zj@hovoldconsulting.com>
References: <20260305133851.2952-1-johan@kernel.org>
 <20260305133851.2952-3-johan@kernel.org>
 <9d727cd2-701e-4c5b-9646-82874f2d0a4a@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d727cd2-701e-4c5b-9646-82874f2d0a4a@linuxfoundation.org>

On Mon, Mar 09, 2026 at 02:26:03PM -0600, Shuah Khan wrote:
> On 3/5/26 06:38, Johan Hovold wrote:
> > Driver core holds a reference to the USB device while it is bound to a
> > driver and there is no need to take additional references unless the
> > structure is needed after disconnect.
> 
> In this case it is necessary for stub driver to hang on to the reference
> to maintain exported device status.

But the driver does not hold on to the reference taken at probe after
disconnect returns. The stub device itself is even freed at disconnect
and cannot be used to release the reference.

Which exported device status are you referring to here?

Johan

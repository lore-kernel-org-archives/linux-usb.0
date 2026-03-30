Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBEF3CAE92;
	Mon, 30 Mar 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876407; cv=none; b=Os3hwRZI3vdavL8wFaoOLWlUUU3btIwz8d3jq3e3XcOA4WVuk7DQ4ulXS97U3qsp0Xv/JOf3avvI95vSn2NZr6SHNi7D7p8p7kVzCX4tzUImJDMbioK3mjB8Mvz2NG/ZNRe4eDBw8xET6s4LDFrNnZ7Wxw7aERFr3HWDSCHqYos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876407; c=relaxed/simple;
	bh=iRu06Dw2d6ph0U9tYPqV94xGWUm85Z93YsLg0rQ7yfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxJ0rM0eQyQ2TAhugvBVaGLky4kHv8yIfS23np3cJSUSfM1tOuK4fFKX9weRNHAbpFmdWHdAgw4Iwh53ZmkqaoSEGhsngJeCghTZVECzZKEzNEjsQ8wz/zn+SjphxEC9ClRKV5kIco8wRdypKW8fFZszVdCUUJ2qsKESFeGAwWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NGjuAb6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NGjuAb6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459EEC4CEF7;
	Mon, 30 Mar 2026 13:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774876406;
	bh=iRu06Dw2d6ph0U9tYPqV94xGWUm85Z93YsLg0rQ7yfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGjuAb6TzZAAsGEjqYnL8OLuKzcIgB75MvduROffiZ1HcceDk38c8L/Q7p12MhhxH
	 4IwuSm9L2p93ZXHeuEqm6bQTH2e0LJsh8Fgk6oYTUiBvdzSXWxJYV/LOcXYdpSb/JP
	 k+upR/AJIHWjTRcb1e6JPxYnASGP4ycvb/Y5ktiY=
Date: Mon, 30 Mar 2026 15:13:23 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?0KDRi9C20L7QsiDQpNGR0LTQvtGA?= <symansel@outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: cdc-acm: Add support for second ACM channel on more
 Nokia phones
Message-ID: <2026033015-badge-huddling-14e8@gregkh>
References: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8008c91-52c1-4a5c-ac96-dd45f109c68c@outlook.com>

On Thu, Mar 26, 2026 at 02:37:41PM +0000, Рыжов Фёдор wrote:
> On Nokia Series60 phones, second ACM channel is used by phone
> applications to communicate with PC. It reports "vendor-specific
> protocol" so kernel does not expose it as tty by default.
> 
> This patch extends the whitelist with all S60v3.x and S60v5.x phones,
> supported by official "Nokia PC Suite" driver for Windows. Device IDs
> are taken from its installation configuration file. Older S60v2.x and
> S60v1.x devices were not added because I have no hardware to test.
> 
> Signed-off-by: Ansel Hayashi <symansel@outlook.com>

Does not match the From: line :(

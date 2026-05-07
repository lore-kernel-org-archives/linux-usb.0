Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0EB2E7F3E;
	Thu,  7 May 2026 15:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169548; cv=none; b=TdrDRJ4bVSwbGXF2vq2FvfvAjnVVVtDeLN8QAfUX18PaoaE0B7WY+LEtWtJaMfc5Ar5lLUbFFJ1jlfs8D63lDUGA9MxttcbNExk/T7VDanN1OF5uDk2e9/h2DzbsDFXxIO+Kmyq/yQ+W5swmCVsL/5cepxLX1tNQ1Uu19hGvKOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169548; c=relaxed/simple;
	bh=QY8yOIx4jTfNbhrkE7Gp3jRPtWP9JyFFqaxegJdPGvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1wKcSrbWIrF+x0pdQJNiYdloc60axMHGHFdzj6Sp99Hc9mAh/C0oxpUtzxYaMb1LOax9Y2ewkFr2eLq96mcptDnQLll219lbeDJUELAoxxm4IpLu85vtn890+nzTEsSr+7mdxKwybZ2V662pp3tgsybWVMKPJhCxvUl/AMlfPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL8R0IKQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL8R0IKQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDD8C2BCB2;
	Thu,  7 May 2026 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778169548;
	bh=QY8yOIx4jTfNbhrkE7Gp3jRPtWP9JyFFqaxegJdPGvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FL8R0IKQ7ajwdCbq6/0usk0nTTMxKRK2DYKL5PpOsLJLnYorl93hbgE3BgCIms565
	 VOmK344Yy5oy0d+05StfkR/obZC4BuiNv68y+cDOA+gAHmpstYRFfVLtB73JuY9q3i
	 EukB7g0K3HF3WMoXU/1THB73cQ5AtBESqAhpxmrisWVypjV/dvRrBngd6/LvO2kQSX
	 fZbZ5LaZQIuMsnHC26JmvAHHsVU2d1r+3BltidXscCQ3v06ZzX2bR6Qn8+xwaTsfCo
	 UI5wP87MJqfYfXvUTJY+icfd5wzHa0mszqQ9j/Q8FOlGgQiE6ECmoB28AIsyteLRYY
	 PaYUmStObPaqg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wL17x-00000001DQU-3e1d;
	Thu, 07 May 2026 17:59:05 +0200
Date: Thu, 7 May 2026 17:59:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Crescent Hsieh <crescentcy.hsieh@moxa.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/4] usb: serial: mxuport: add sysfs control for UART
 FIFO
Message-ID: <afy2yeDTHiVFkPmy@hovoldconsulting.com>
References: <20260324035041.352190-1-crescentcy.hsieh@moxa.com>
 <20260324035041.352190-5-crescentcy.hsieh@moxa.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324035041.352190-5-crescentcy.hsieh@moxa.com>

On Tue, Mar 24, 2026 at 11:50:41AM +0800, Crescent Hsieh wrote:
> Add a per-port sysfs attribute, uart_fifo, to allow userspace to enable
> or disable the UART FIFO at runtime.

Why would you want to do that?

We should try to avoid driver specific sysfs knobs.

> Map the requested state to the RQ_VENDOR_SET_FIFO_DISABLE vendor command
> and track the current FIFO setting in the per-port private data.
> 
> Initialize the FIFO state during port probe and remove the sysfs
> attribute when the port is released.

Johan

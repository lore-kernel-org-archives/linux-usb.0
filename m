Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8321363E
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dta2NFWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9C0C433C7;
	Mon,  9 Oct 2023 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696842060;
	bh=dQT7iUd2AfhYtjvvTu1CpRBVv1SLYDA4gQTFUi/RIcU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dta2NFWtB7+QqevXJa0GwnM8jlnTPPPe69FZ2U5a19P2laJKdGOT1O8P2lApt0Ath
	 EVSPbXouE6nRDT8vnIZLB29/oCscU3STN3TSz9ZeVQNui/qMEhbLRl5HH/OmRjknDR
	 SNLmlS8/jmBMF9T9NORg5Ol6PL5Qgw9PdX6KCnH4=
Date: Mon, 9 Oct 2023 11:00:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brian Kloppenborg <bkloppenborg@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
	Brian Kloppenborg <brian@kloppenborg.net>
Subject: Re: [PATCH 1/2] Make cp210x respond to modem status changes (CTS,
 DSR, RI, DCD) by default.
Message-ID: <2023100942-stood-desktop-6703@gregkh>
References: <20231009023425.366783-1-brian@kloppenborg.net>
 <20231009023425.366783-2-brian@kloppenborg.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009023425.366783-2-brian@kloppenborg.net>

On Sun, Oct 08, 2023 at 08:34:24PM -0600, Brian Kloppenborg wrote:
> ---
>  drivers/usb/serial/cp210x.c | 62 ++++++++++++++++++++++++++++++-------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

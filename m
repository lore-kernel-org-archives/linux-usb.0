Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA382DE71B;
	Fri, 23 Jan 2026 16:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769185149; cv=none; b=DHqdlUyq/z1m4C6d0Cdm/jRfNlwC3gtS+7XW6vbezWcMUXWzRWAyPAOqnXFTSCrXBWc10MUOGl7+mcXoqHrw140JmVlGqJspMkxJl7DvxsHMeq/x2VY0vKd04xSSygxGP58raarrbMeaK6KWVE4W40hyU4epxKmzR3m6RRUoLjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769185149; c=relaxed/simple;
	bh=LKU+gv5DL1pnecmD6eHZ6NraOfOJnddZCFDmw3chZgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXspXMLMFYn8ulkjmrxn2ROsrHyPcmdCsh3puendpgRg2pIGovALVM0SP+Jf7hktyiBrQhStomie1kIJ6aejrYtnCPnq5itS7Kl86OQ6YvvovXFK2QrxRMmlunCEf7dJhSzhLmkUWm7bBLM+Ty8HaofsqIh+SWPmK/ZMAjS5JT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ay+gfnIO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ay+gfnIO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5A8C19421;
	Fri, 23 Jan 2026 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769185149;
	bh=LKU+gv5DL1pnecmD6eHZ6NraOfOJnddZCFDmw3chZgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ay+gfnIO8Uez1Y2knzqwdRFGsWLjyZTTA8PZwdN90+kYslnvSqsWgZb+1CB0nEVv9
	 P6I3Jt6H9ccv3o+Wpu7ak92+slIW3QITO8jINsQbZW4OGOwrUGNff23VX7nZQhRA/B
	 zyz9KO+PWNd/K8N2tPzCd0q/FP4kX2LsRkh8ywnE=
Date: Fri, 23 Jan 2026 17:19:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jan Remmet <j.remmet@phytec.de>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Enable VBUS based on role state
Message-ID: <2026012343-rockfish-candle-d3d9@gregkh>
References: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-wip-jremmet-hd3ss3220_vbus-v2-1-bcad313ce92b@phytec.de>

On Fri, Jan 23, 2026 at 03:52:37PM +0100, Jan Remmet wrote:
> For systems where the ID pin isn't available as gpio use the ATTACHED_STATE
> register instead to control vbus.
> 
> >From the datasheet:
> "This is an additional method to communicate attach other
> than the ID pin. These bits can be read by the application to
> determine what was attached."
> 
> Use this method if id-gpios property is not set, but the connector node
> has vbus-supply defined.
> 
> Check regulator state as peripheral and detach can disable vbus.
> 
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> ---
> Changes in v2:
> - Added check if regulator is already disabled. As detach and
>   peripheral mode cause an interrupt.
> - Link to v1: https://lore.kernel.org/r/20260115-wip-jremmet-hd3ss3220_vbus-v1-1-b7d9adfbe346@phytec.de
> ---
>  drivers/usb/typec/hd3ss3220.c | 30 +++++++++++++++++++++---------
>  1 file changed, 21 insertions(+), 9 deletions(-)

Does not apply against my tree, what did you make it against?  Can you
redo this against linux-next and resend?

thanks,

greg k-h

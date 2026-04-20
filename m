Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F29713B7AE
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 05:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776663564; cv=none; b=o7RQom3y1Y2yKOorL9XVwIqaDnXnvAJCNtGMpshL7n+4c6lKaUimzU1EuIqDobF5+/ET2Kf8BOXU+xxXFsR8V2ixTQsP4u3IZlHPR+435nnMIDjgwk4gJDzcga1kbOq6taL9wcozFO5/ObI7lXJOKGm2OQ9287jPe4yEwVrBf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776663564; c=relaxed/simple;
	bh=AKwFOI7MF+YfT1zbL6T7X2TF2aqmHkVv+0xo3PEsSBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu4OJo0bs7R6HmvcL+SN8Ky4ybqeWqUowqBoUxgGpMctAkfhC8aRxbi7hD036v5JfiIedtMHnC0dupIe99J/RhaFvmqd4BibrfxxHP8Rnnam1sfKTtSR6XPjpN/71+83X2HRnHIWRM2RU8Jx8FhdZLFxCTbZkMCguJeYObE37VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rbwMqum1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rbwMqum1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583A1C19425;
	Mon, 20 Apr 2026 05:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776663563;
	bh=AKwFOI7MF+YfT1zbL6T7X2TF2aqmHkVv+0xo3PEsSBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rbwMqum1ocJoBGBaHTvmueymNzTrWioC8as4elvIqjdYWWdRSC46V0gR6CnMrDyko
	 9NxWsNas8W37bf5VGyF7E4tNfPcTf8DKt86ijfBQQtZ2t3x0hRlmSO5vXYC8AauxdA
	 5w2QNYSTZ6vDWOgr88WkstzTs69mKi2P+ul0+Shk=
Date: Mon, 20 Apr 2026 07:38:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cristian Cocos <cristi@ieee.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: vhci_hcd: bulk streams
Message-ID: <2026042051-tile-pecan-048c@gregkh>
References: <935d4557704d963475364ed1fb033c20e8bb7cbb.camel@ieee.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <935d4557704d963475364ed1fb033c20e8bb7cbb.camel@ieee.org>

On Sun, Apr 19, 2026 at 02:25:32PM -0400, Cristian Cocos wrote:
> As of this writing, vhci_hcd does not support bulk streams. Are there
> any plans to enhance vhci_hcd so as to support bulk streams?

We have not seen any patches submitted for this.  If you need/want this
feature, feel free to contribute it!

thanks,

greg k-h

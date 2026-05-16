Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442241DE8BE;
	Sat, 16 May 2026 07:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778916010; cv=none; b=sumFkI33SrEY5ikfdSeA9huuQZQj0w8varST+0yp0/fcygshxdW4S01OaoA9Ch4GZMvnWz3Eyd+80lh97fqF36zChdSfIAm8uCc/FCkXMy/0LkjjNC4uLVKzbr/7ma5vhhGY9Yz3tCigKjinE/RKV4OL1kBkeycN6RXCCwxwwBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778916010; c=relaxed/simple;
	bh=sCu85YnrVnf9FTzBJ6rktsooVUVwDqhWUxeiNT3o32A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8eE7F0QZwC5/s/n8ojELjvIuC0cKhafOTU7LA9lk3aabFR7SbP17PL8cDh4E4unOnU4E90ELcGZ+zxuDUxU3yDw69P4OTPXSJaGR2GNTRFFUN7BwmGapzI606cq2tQOFx0xieNTQj5ns1Ai3folWM9cOBumU8o9qP1/p25e5Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G++jHRjW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G++jHRjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A14C19425;
	Sat, 16 May 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778916009;
	bh=sCu85YnrVnf9FTzBJ6rktsooVUVwDqhWUxeiNT3o32A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G++jHRjW5hm8IcmVfQh38sdzrZygQ8p78VFaXYEF3EpsR5JIKD2ej2XfnGF1fYXoV
	 95xcOmBRgwDn48gE5CBHXEzPnf1/F8n8ss4Lkcp4fpoYn0rP4bLj5YvmkDL9I0HPim
	 lP8FqGSkNcmxbQPIQYFCkzkwzHmgA//KeySSq6Fg=
Date: Sat, 16 May 2026 09:19:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Matthieu CASTET <castet.matthieu@free.fr>,
	Stanislaw Gruszka <stf_xl@wp.pl>, kernel-dev@igalia.com,
	linux-atm-general@lists.sourceforge.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: atm: ueagle-atm: add missing uea_leaves() in
 uea_probe()
Message-ID: <2026051657-scruffy-embark-45ea@gregkh>
References: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
 <20260515-ueagle-atm_cosmetic-v1-2-9a15e5e45bd7@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-ueagle-atm_cosmetic-v1-2-9a15e5e45bd7@igalia.com>

On Fri, May 15, 2026 at 08:54:13PM -0300, Mauricio Faria de Oliveira wrote:
> Pair the existing uea_enters() (function entry debug message) with
> a missing uea_leaves() (function exit debug message) in uea_probe().

All of those should also be removed, we have function tracing if people
really need/want to see this info.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C249139E190;
	Mon, 11 May 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502599; cv=none; b=nIMp8FAUQZJldC0Ka9t8xD74mG/crDuOpq7+J/RDZouih7FDt7CQgdl/w5caC6EleJ5SK8UrZKCHWl+sj0dPumJz8j2RJ06pxEUmQrDeN5/wlY75NAmGCGAn4uTSedYKMul+AXqImTrmGqN13XpCoADjo1dfpsJQb0ELLSY5Je4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502599; c=relaxed/simple;
	bh=AdlorSgCtBmPOONlp4nH3YbTIzcJ+kTT+g17vanKSac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqV8pZrUSoWuGS+4jf7/BWR66MhebFn15EhwqslgQk9q3AdPmae589v/5rxRPvZNKHRDNAONPYejdq42cL/AMZYOy1km9+gCT8km4q3AQuSAcaLM2r90bGjCJkJekTPUEYidgKVqqCUCDzp+7VxJ4sZ7Uu6lUksGFi1ZwSeFNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sBLTXXxU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sBLTXXxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADB6C2BCB0;
	Mon, 11 May 2026 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778502599;
	bh=AdlorSgCtBmPOONlp4nH3YbTIzcJ+kTT+g17vanKSac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sBLTXXxUSYw32gXPcb8gw07SQ9sncPOEkpEo2gMCImBngMjrP2qXbOd+9eFdd6URn
	 2jSfQ4c2UDiNkMjsTqDoZ79gGXK0LwhmBNi5/BNacaiEUcthXwn936PpuYjuCUL3dy
	 9RZKBiAbu258cAg0u+k2z1lejTwjOhAK88pLR+yg=
Date: Mon, 11 May 2026 14:29:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: vipoll <vipoll@mainlining.org>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fsa4480: Add chip id read retry loop
Message-ID: <2026051145-comic-collision-4797@gregkh>
References: <20260511122246.31673-1-vipoll@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511122246.31673-1-vipoll@mainlining.org>

On Mon, May 11, 2026 at 04:22:46PM +0400, vipoll wrote:
> From: Victor Paul <vipoll@mainlining.org>
> 
> The first read attempt may fail on some devices (e.g. Xiaomi Pad 6)
> 
> Cc: stable@vger.kernel.org

What commit id does this fix?

thanks,

greg k-h

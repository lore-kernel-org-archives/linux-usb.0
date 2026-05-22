Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000D63A6F00
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779437152; cv=none; b=Xh4GatvCy3cdLDZDL4ZA5WKhXLdjSZpYRS911FP/B9vep/IbwV4QDVH3CKQu1wozwjcCuBE3x/skVBDzplL4wxp7I914PQa0wkIx0dh4DhWtK5YbBp/AI63p2mtpyYxELweqK/bPlX59la4h8MfUMZJ2q5IyA0m8yCwNiYeyKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779437152; c=relaxed/simple;
	bh=cNkEp/QpTEM6Jwt7GhdH73ubSWnOw2t/B57Gw2Bi6zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFt49DsV3N+LlV7DWX5astOhFJTydVZFiOme8zF186/3LnNwLpNakqlliopmhm8AGuEgOE1wqY1m4SoC2pJ8/O0Fde5CeIQFVO7nZ4JSETYkkWlJaFK4xSq2cSvQao5J3GUIt7OsUUlrk3rMFFJNNAgJ1AuLz4x/wDQtlF03bX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4H253Bq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4H253Bq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDA81F000E9;
	Fri, 22 May 2026 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779437149;
	bh=cNkEp/QpTEM6Jwt7GhdH73ubSWnOw2t/B57Gw2Bi6zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q4H253Bqc3rY06tH4IanRR7OcAWF4M0XDi745XInMVh2AxSUpotzME5CoEM69by8f
	 UzbrVMD1RW3XBoBdZ1TsGMN43r9bJtR82OTfO2fBkmk9R8nZZIYV6qNQzVONXXazfa
	 wUXItNpx8x9hPZrDW7Uz52SbBLFdLBd+Zqzvcr3wA5KJmsvpPiathSb13RAgzLguA1
	 dj8itdgyeUCze//Qv1Z2EZ2bEIOixKDY9mix89/yCcMjnYCdO1QwdBNvXiJCv9tosz
	 eNP7XvBCEgb1pu1JnVLXtJQMy4Uu75Ig5RwLMhJjnw4RRg6dAztX7abN3uqG33zAnE
	 cU6CvX6xOV4qQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQKt8-00000003bT9-3sMn;
	Fri, 22 May 2026 10:05:46 +0200
Date: Fri, 22 May 2026 10:05:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Charles Yeh <charlesyeh522@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	charles-yeh@prolific.com.tw, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] USB: serial: pl2303: add new PID to support PL256X
 (TYPE_MP)
Message-ID: <ahAOWpZPebTgI_GY@hovoldconsulting.com>
References: <20260325120123.1989-1-charlesyeh522@gmail.com>
 <2026032549-zodiac-navigator-23ac@gregkh>
 <CAAZvQQ4r+5ZGDp=V3k0hU2qUpS7pta2CfmPCf=qSoBU7r4WEsA@mail.gmail.com>
 <CAAZvQQ6aM73++Hs5ajRgVKnWEOpRCGT0Oe8nyLm1fDBqS5C-5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ6aM73++Hs5ajRgVKnWEOpRCGT0Oe8nyLm1fDBqS5C-5A@mail.gmail.com>

On Fri, May 22, 2026 at 03:49:20PM +0800, Charles Yeh wrote:

> I am just following up on this v2 patch.
> Please let me know if you have any comments or if there is anything
> else I need to update.

I started reviewing it last week but got side-tracked. It's still in my
queue.

Johan

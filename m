Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867FC3932C3;
	Wed, 26 Aug 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787725308; cv=none; b=b/SYTnyMy4OrXKTss65ZlnQs+AEewRx7Ow8wguqxMPHr5QRh/pVxli2u8YvbnOZYQa/TfGpCw/mFtmeyxLJy5ynioXdU2lAp5EfMM2Ld8+yFQ81Vk6Ua0MBeEgnOi8nmAX9YijNVEnqsXnhTxmvs+pm6Bi/1OUpGvlUCPLtgKpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787725308; c=relaxed/simple;
	bh=A17v4SPaETOxoBOMvNXuU7TvtvaC7bGSpL6fHzx7FK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taD+nOsInBhjbu5LIKmQmjF8qjWA0MKiwGvJmv2VrggxUWuWBP1MKnJMIjUDsAsq9aFxe+rpGXXtJfh79cj383jzmW06QIGsX083nBc3WkZirHTxbWpQ7QRIz1OHzGLYFaDKyEb2LL/15aH9XuethiInh2fZnxVWlk7cULA5KMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve5ex1SP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve5ex1SP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 095C31F000E9;
	Wed, 26 Aug 2026 06:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787725307;
	bh=rZDOG1xYcK+nhmg3NO0cjCOpH6cOyb7hTnClj24ugSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ve5ex1SP/TOTa89zwiLprH5XZtSFsb39yrBehYlQ8BrYv3F6BAP/MnvgOiwifoyO/
	 KDTPqLt6AKyXqEyQJryNMDC/TRcS5jP0Svmr2AoP/uS8lzWiEc/1WvqK9xHPV2d7po
	 Ax5H0cilC/qaMDBQMnobAk3Aqmx+0FQLx5pYdloDiyyTgdhpRSXcc+KV1wm+a7daw1
	 B5D0qoNjvIKDgUrYcrOC5KCMIQl0zkgUVeptY7vhoQLa/NMVNA8z9VOuavOcLCztXp
	 KRlV/mhqrCGAEqK/SthgyjD+MWLmx5ZkULgE9+OdRUKteZXOAhRr9lN35xQc98Aarp
	 UMOpVopdNzR7g==
Date: Wed, 26 Aug 2026 06:21:43 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tbt: Correct swapped TBT adapter type values
Message-ID: <ao6F9_7DfZx-xNNJ@google.com>
References: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>

On Tue, Aug 18, 2026 at 06:20:03PM +0200, Sven Peter wrote:
> Table F-10 of the USB Type-C Cable and Connector Specification R2.5 on
> page 412 defines bit 16 of the TBT3 Device Discover Mode VDO as 0 = TBT3
> Adapter and 1 = TBT2 Legacy Adapter. Linux has those two swapped since
> their original introduction in commit ca469c292edc ("usb: typec: Add
> definitions for Thunderbolt 3 Alternate Mode").
> 
> ChromiumOS EC's include/usb_pd_tbt.h has them the correct way around
> and references the USB Type-C ECN "Thunderbolt 3 Compatibility Updates"
> as fixing an error where they were originally swapped which is presumably
> where the wrong order originally came from.
> 
> I've also confirmed the correct mapping with an Apple Thunderbolt 3
> to Thunderbolt 2 adapter which does set bit 16 in that VDO.
> 
> Swap the two values and update all users. Also rename the old defines
> so that no user accidentally ends up with an inverted value.
> No functional change.
> 
> Link: https://usb.org/document-library/usb-type-cr-cable-and-connector-specification-release-25
> Link: https://chromium.googlesource.com/chromiumos/platform/ec/+/db93814b6e73c8545d23714fe0674c10814d901a/include/usb_pd_tbt.h#90
> Signed-off-by: Sven Peter <sven@kernel.org>
...
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-

For cros_ec_typec.c,
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

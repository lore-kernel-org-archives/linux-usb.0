Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78F406261;
	Mon, 24 Aug 2026 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571119; cv=none; b=Gb8HLdD/kvmLq76mwIcaWu2sC8BcjuBOloOMITxHtwfzZyk4nx51GSbhz2/FMgHPFqwRdrQCzcXlFbFDf7udWYi1ogdDLet7ZpTu7lfuHU/u+TOUr+FsVABKW6VYt/WAcyPtm92yua7HPFoeJe8wxHwZ/PZ++cXHs9ijTI3QV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571119; c=relaxed/simple;
	bh=EYMYdwXdg6z7MIH9WURjs406goCzCbmpieTCp02weOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8Gg9tA+ywz4seW1yt3BCB4e1PW/jhJ3pvENG+bRb5fZkgnmUV3e0PttzRt/u9zWIPhVMcvCwzMKrU4hFmgELcG0x+AXwVSQIreTtYO4/6CtDF8mnTr/Gws7kKLBpkCLkrjNoezIerUhxe0YkAhe9rqkkHe2namULj/NNlrbduc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzdmdI7Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzdmdI7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C391F000E9;
	Mon, 24 Aug 2026 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787571118;
	bh=wcOBll4DRF2xHRnbLSjT/re7AM4u1F1OT5C5VGFZo0g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dzdmdI7Qdki6AlneDAImOc4I3xAnNkzgD2ICMBZXLez7HyBHGoBZVys8kjryn/wAR
	 Cmus39rIBJfPecfqsfoHmTxjaDfjIUtppuuLZA6SujN4FRaGuXyJyIQZ8ZmcSoZyVW
	 wziTsfwrO36EgdXzZPXiGmCizxFGh2URu6i0di/hFKT8UCFv2k26mtEXGj3NS8rfLw
	 YIRI7sTH2On37SRQbfeEIkc2DpG72cpWNKEPpYGJDxvxbZHXRjmcGFZ1rb705kVvY8
	 lvXo15keVK7TNU2bIBOljwobhL0FYFbfVy87UlWi23F0Ytp4+UTHU+rVnIvFaucKMQ
	 AX10YL93vaZHQ==
Message-ID: <20514e95-60ea-48de-979b-87b1dd7bcc12@kernel.org>
Date: Mon, 24 Aug 2026 13:31:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: tbt: Correct swapped TBT adapter type values
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>,
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Jameson Thies <jthies@google.com>, Andrei Kuchynski
 <akuchynski@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
References: <20260818-b4-tbt-legacy-fix-v1-1-797831e3df3f@kernel.org>
 <aowm3TvXYnUv78FM@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <aowm3TvXYnUv78FM@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/24/26 13:11, Heikki Krogerus wrote:
> On Tue, Aug 18, 2026 at 06:20:03PM +0200, Sven Peter wrote:
>> Table F-10 of the USB Type-C Cable and Connector Specification R2.5 on
>> page 412 defines bit 16 of the TBT3 Device Discover Mode VDO as 0 = TBT3
>> Adapter and 1 = TBT2 Legacy Adapter. Linux has those two swapped since
>> their original introduction in commit ca469c292edc ("usb: typec: Add
>> definitions for Thunderbolt 3 Alternate Mode").
>>
>> ChromiumOS EC's include/usb_pd_tbt.h has them the correct way around
>> and references the USB Type-C ECN "Thunderbolt 3 Compatibility Updates"
>> as fixing an error where they were originally swapped which is presumably
>> where the wrong order originally came from.
>>
>> I've also confirmed the correct mapping with an Apple Thunderbolt 3
>> to Thunderbolt 2 adapter which does set bit 16 in that VDO.
>>
>> Swap the two values and update all users. Also rename the old defines
>> so that no user accidentally ends up with an inverted value.
>> No functional change.
>>
>> Link: https://usb.org/document-library/usb-type-cr-cable-and-connector-specification-release-25
>> Link: https://chromium.googlesource.com/chromiumos/platform/ec/+/db93814b6e73c8545d23714fe0674c10814d901a/include/usb_pd_tbt.h#90
>> Signed-off-by: Sven Peter <sven@kernel.org>
> Shouldn't this be marked as a fix?

I left it out deliberately together with Cc: stable because there's no 
functional change but I can just add it if you want to. The original 
commit is already in the message.
>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks!


Sven


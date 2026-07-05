Received: from mail-m1973198.qiye.163.com (mail-m1973198.qiye.163.com [220.197.31.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5082283C82;
	Sun,  5 Jul 2026 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783248784; cv=none; b=JH/36QzH4dG5zl+5c3QMOQtC81eCnMkr3eUUkdATD/kWf4aLJrs3foO/vNyLPg50Xhfit0qy5okHgnYzKlV0OXhO7uH3fwAhY9rS3SERg+KjT7uO769aZbyUzP0c/4ptinUIzuQKKjpsbWRTHHhdxMLrBhR57+v3lzNqTy7aqXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783248784; c=relaxed/simple;
	bh=uPI828nTo/0iCTmF11IIT0XLKOHO0YFN/tYS6JthVlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHhuZAMoUV0/pbMBhe3ydgnA/8dRqYouMChzwN1yV57ooIIDzFfTNm1+e5hd9C3aEP+80cnPjwJdf+UTlqBpQC2UDJAVUPj+nX3AmYARL8GJHBYHEMnpKU+kQB+X2SSAmFzqeBr/W9Brhb0fEYwN/sBsW32jB4rC+tiEdqR1kKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=KiCDzC/F; arc=none smtp.client-ip=220.197.31.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="KiCDzC/F"
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 44f01c1f6;
	Sun, 5 Jul 2026 17:37:12 +0800 (GMT+08:00)
Message-ID: <6bb87b1f-6877-45bd-a140-48536503259f@rock-chips.com>
Date: Sun, 5 Jul 2026 17:37:10 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
To: Julian Braha <julianbraha@gmail.com>, Xu Yang <xu.yang_2@oss.nxp.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
References: <20260705065832.184-1-kernel@airkyi.com>
 <af9b60de-ff6e-433f-a757-ed7e1dca6caf@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <af9b60de-ff6e-433f-a757-ed7e1dca6caf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9f31a395f703a7kunm0b364f9355ea36
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ09OVhgdT0pNTh5PT0oaGlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=KiCDzC/FqKtu25buESo8+sF0m+gRSGZiafXT1WGmJbKSl0xelaDH1xBWuuD/9wkHFWZCQ8TfunKSyQUyWpPPEriMu9ZpuCXLVgbix0eLYP/Swru4xYlYyaIYee1x7D1nRQCuZAsvHKoFqvF/t08e1ekvqf3leY2MypCmjAtFfdU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=zqvHFGs4T06Ko3WwbEzbqwOwYYN8mnJIG2bQqSgRSSY=;
	h=date:mime-version:subject:message-id:from;

Hi Julian,

On 7/5/2026 5:20 PM, Julian Braha wrote:
> Hi all,
> 
> On 7/5/26 07:58, Chaoyi Chen wrote:
>> +	imply DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
> 
> When I suggested that 'imply' may be more appropriate here on v1, I was
> hoping to have more of a conversation first.
> 
> 'Imply' is safer to use than 'select', and intended for use when the
> option is highly preferred (but not actually required).
> 
> Perhaps Xu could provide an opinion?
> 

I think this is reasonable, as x86 works fine without DRM_AUX_HPD_BRIDGE.

-- 
Best, 
Chaoyi

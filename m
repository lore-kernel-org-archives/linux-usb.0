Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E03845BD;
	Mon, 27 Apr 2026 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777330784; cv=none; b=SpxE2/gOcjmbqfakZQoHKkcYAEwt2dAN/SgeTB/NNKYGPvY4hW59g56kPa1J+Jd59qsCK8XyzyoycbsDlcfaUAKTJ5D7My1wsmhfB1pzkOCF2/vn2oVB87xNW1esr0tiU4bbwjlODf9oZsJZ9zV+7N2UiAHLEn6Rs6HRwYDznOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777330784; c=relaxed/simple;
	bh=knUkcCc5EmcOrafYnCBLCwB/rOV9N9en197aZT0lQt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfuq6Jdy7Dnrx8+zoriKBqLJoxnKX6jGnsHiAzcXX5xmQ2AgDbecw7FFrwJc8auWXDTVXKgttI/uHJAp2jUQQSsbxncoz/bqjdIUv/4JJPV3hOmOj7TlvwJZJqjC8nkRbSxZk3EVHEIDjWWw0lXKv3sJBV7b2EJlIbR/4pdsU0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CpD8K2KD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CpD8K2KD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA737C19425;
	Mon, 27 Apr 2026 22:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777330783;
	bh=knUkcCc5EmcOrafYnCBLCwB/rOV9N9en197aZT0lQt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpD8K2KDpBckLOFaZYOghfK3TOQmWbGFo+Q1WZBDsMyvgCqVwaOD7vVBt3KjcY0mz
	 +E9KEHORVYiIj7PeuPaCdIP9Ze9gxHeGU5K7v+HQSADr4xJxHCoM1VlD9Ou9Ae2CzF
	 vC2iKYcmrRG7uKohM+V75UmEWov76K+iTbQeVhC8SnWpb1ImjBkHq0J3SKG0v/BL/7
	 Qb+TAXLMsmiFDwzj18sxEd8F/Ehvf9BWfWa6zuDbpMXBk58yWl2I+uOvt9BljdCy+I
	 RdOtp6xlYOHxdDEiyyiWOlMos76IsldDQNtp3NQtM7/p3i7RRWA5xxmejnFMMheBXo
	 XA0ukupuYxV/g==
Date: Tue, 28 Apr 2026 06:59:40 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Pawel Laszczak <pawell@cadence.com>
Cc: Yongchao Wu <yongchao.wu@autochips.com>,
	"rogerq@kernel.org" <rogerq@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: cdns3: gadget: fix request skipping after clearing
 halt
Message-ID: <ae/qXIT19Z2zWsDs@nchen-desktop>
References: <20260423160601.2949010-1-yongchao.wu@autochips.com>
 <ae66WphA+lO6t3rE@nchen-desktop>
 <PH7PR07MB9538E83DB108635EAE7B21E3DD362@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH7PR07MB9538E83DB108635EAE7B21E3DD362@PH7PR07MB9538.namprd07.prod.outlook.com>

On 26-04-27 09:01:47, Pawel Laszczak wrote:
> >
> >
> >On 26-04-24 00:06:01, Yongchao Wu wrote:
> >> According to the cdns3 datasheet, the EPRST (Endpoint Reset) command
> >> causes the DMA engine to reposition its internal pointer to the next
> >> Transfer Descriptor (TD) if it was already processing one.
> >>
> >> This issue is consistently observed during the ADB identification
> >> process on macOS hosts, where the host issues a Clear_Halt. Although
> >> commit 4bf2dd65135a ("usb: cdns3: gadget: toggle cycle bit before
> >> reset
> >> endpoint") attempted to avoid DMA advance by toggling the cycle bit,
> >> trace logs show that on certain hosts like macOS, the DMA pointer
> >> (EP_TRADDR) still shifts after EPRST:
> >>
> >>   cdns3_ctrl_req: Clear Endpoint Feature(Halt ep1out)
> >>   cdns3_doorbell_epx: ep1out, ep_trbaddr f9c04030  <-- Should be f9c04000
> >>   cdns3_gadget_giveback: ep1out: req: ... length: 16384/16384
> >>
> >> As shown above, the DMA pointer jumped to index 3 (offset 0x30),
> >> causing the controller to skip the initial TRBs of the request. This
> >> leads to data misalignment and ADB protocol hangs on macOS.
> >
> >Pawel, Is it a hardware issue? The cycle bit has already been toggled before the
> >endpoint has been reset, why the DMA pointer still advances?
> 
> Peter, do you remember what the TD looked like in your case?

Sorry, it was almost 6 years ago, I could not remember it well.

> Maybe that’s where the difference lies. The patch description states that
> it jumps from 0xf9c04000 to 0xf9c04030, which would suggest that the TD
> consists of three TRBs. The driver only changes the cycle bit on the
> first one. 

According to Yongchao's statement:

	According to the cdns3 datasheet, the EPRST (Endpoint Reset) command
	causes the DMA engine to reposition its internal pointer to the next
	Transfer Descriptor (TD) if it was already processing one.

My points are the cycle bit has toggled by SW before EPRST command, and EPRST
command would reset DMA pointer to the 1st TRB within TD, and it is executed
later than cycle bit toggles, why hardware could go on handling TRBs even the
first TRB's cycle bit is for software?

Peter

> I’m not entirely sure how the controller assembles this TD.
> I need some time to try explain the controller's behavior in this case.
> 
> Yongchao, could you confirm if the TD consists of three TRBs?
> 
> Pawel
-- 

Best regards,
Peter

Return-Path: <SRS0=idDB=3N=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2890FC2D0CE
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 08:36:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAE9D2071E
	for <linux-usb@archiver.kernel.org>; Fri, 24 Jan 2020 08:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579854977;
	bh=kY6uLDU53WJk7136qvLKPKYP/af1SJ9cRZV/kzzqJuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=yhh4mnNZH69UzlqZXOOAEbbF3hgIZHGfJz8TT7771JhdpGpr2I00Xr/Qtj6iFdt8o
	 ucNrOBXhwEtx5/V42aPIvapi3W/CJRHUAhsD08y3ibGcdFs6qp+fMJJs/PrWH+kmSB
	 hOs7p6SdsFPNv1oaEnlXwg3WHIEuk44RmTVPJoIc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbgAXIgN (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 24 Jan 2020 03:36:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:57078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgAXIgN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jan 2020 03:36:13 -0500
Received: from localhost (unknown [145.15.244.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88FD52071A;
        Fri, 24 Jan 2020 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579854972;
        bh=kY6uLDU53WJk7136qvLKPKYP/af1SJ9cRZV/kzzqJuM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arZCrcphoIKyZIzdqFweXTfxMxylrS+mWFhIj9c0O5vLHP7LOtxGGlFdCLBsRHaoO
         9jr3YaokIfkg0nfx14YzhoLLFUxHTsPmdb5LrsWKSzxzF1rmY/UC4ICid9opeGU7N8
         Eu4YDYyMov67wjrdHIYkcOFpBJwCvkTQj+h+JwEg=
Date:   Fri, 24 Jan 2020 09:36:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Colin King <colin.king@canonical.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: cdns3: fix spelling mistake and rework grammar in
 text
Message-ID: <20200124083610.GA2923791@kroah.com>
References: <20200122234437.2829803-1-colin.king@canonical.com>
 <87zhee4p7y.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zhee4p7y.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 23, 2020 at 09:16:33AM +0200, Felipe Balbi wrote:
> Colin King <colin.king@canonical.com> writes:
> 
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The text contains a spelling mistake, "to" should be "too"
> > so fix this and re-work the grammar to make it more readable.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Greg,
> 
> if you want to squeeze this in:
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>

Thanks, will do.

greg k-h

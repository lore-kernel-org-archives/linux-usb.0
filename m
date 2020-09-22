Return-Path: <SRS0=MsX+=C7=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BD6C4727D
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 08:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0402223A7A
	for <linux-usb@archiver.kernel.org>; Tue, 22 Sep 2020 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600764005;
	bh=h6ohU5ja+/oJh56ZNQ1mvntiDY8xerietxp5tSqL5NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=dnFy4moIvffl9nTYj250YAxcf/SvqqNKMAiNzbclfU5/V7vhWcMM7bYS3qJJhMV6D
	 iWaFA49VorqQdMhgy5zOmBpbG0D750fALIWzTQmUSpuIWZ4Mm7cXwE2itE6UZk2dRW
	 WHvXaPjI2Q65Ppf7of6MqekPV041/gPew+pRR+Cc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbgIVIkB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 22 Sep 2020 04:40:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:39766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgIVIkB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 04:40:01 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EB7623A1E;
        Tue, 22 Sep 2020 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600764001;
        bh=h6ohU5ja+/oJh56ZNQ1mvntiDY8xerietxp5tSqL5NQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y8K4YivAz6THQuAOeDJzNgnjcqPpwWnuH/UKx09/6g/CvY2sfJPW5n54GUz1n2pCI
         62Y/ZhsMQmH3BI03SkjAT6C3cX5nmhAfIDb9ZYqrtoPDptlBBKDx3+jjVte74F0NGy
         NblDTZAtPFNlwBIGu/gGYU8REJ9VJscX86KSfPtk=
Date:   Tue, 22 Sep 2020 10:40:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Badhri Jagan Sridharan <badhri@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 05/11] dt-bindings: connector: Add property to set
 initial current cap for FRS
Message-ID: <20200922084022.GB2092905@kroah.com>
References: <20200917101856.3156869-1-badhri@google.com>
 <20200917101856.3156869-5-badhri@google.com>
 <20200920140936.GC2915460@kroah.com>
 <CAPTae5L4UuVDwuVRec1-t3FYMfPMDxhnYY7CJ9gSnhZzHJKH+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPTae5L4UuVDwuVRec1-t3FYMfPMDxhnYY7CJ9gSnhZzHJKH+A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 20, 2020 at 04:06:05PM -0700, Badhri Jagan Sridharan wrote:
> Hi Greg,
> 
> Yes. Have CC'ed all the DT maintainers for v8. Was waiting to see if
> it was OK code wise.
> Heikki had given his reviewed-by tag on v7.

But this is v7 (so says the subject line...)

Totally confused,

greg k-h

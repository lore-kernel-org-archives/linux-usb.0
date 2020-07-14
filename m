Return-Path: <SRS0=da/P=AZ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84450C433E1
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jul 2020 06:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6296E221E7
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jul 2020 06:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594706565;
	bh=QdaFBpDRGpizTzOQaQSCq0rsbtp195RVw7IgKPGdycg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=v+4slGFHd0AF0bSXzcok+NjuKwwQnJ86l66HSzmVACAETKVj98Cghk8pzJhz7+frl
	 o8roa8sDN9usZq1BSwhFEWT6s7Qe3kt97YElIgoKV+KgQn59iKHClFunKV1tvRXwYD
	 vtX9+dVfnBkAsLMCfOG+0E8Tb+/z03q0QMK1miMw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgGNGCl (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Jul 2020 02:02:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:50614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725925AbgGNGCk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 02:02:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D870D21D93;
        Tue, 14 Jul 2020 06:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594706560;
        bh=QdaFBpDRGpizTzOQaQSCq0rsbtp195RVw7IgKPGdycg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQSMa+VKG6cmXxYmbWcOmhW45JT/mB6y5x2wBTHQbfFeO8Zapfl0K9IEnKO4N/urg
         WMqRO4abFXbvDRk8qJtUkMPUSRQML/qiZFL/lID4256toy0KYb2kJHX0ZlD4Qn8Yf1
         Pvei3dwlHlyC6odSWabPDwCIN1T2X+ex0WLCd11c=
Date:   Tue, 14 Jul 2020 08:02:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kyle Tso <kyletso@google.com>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] tcpm: Error handling for
 tcpm_register_partner_altmodes
Message-ID: <20200714060238.GA657428@kroah.com>
References: <20200714033453.4044482-1-kyletso@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714033453.4044482-1-kyletso@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 14, 2020 at 11:34:51AM +0800, Kyle Tso wrote:
> *** BLURB HERE ***

No blurb?

:(

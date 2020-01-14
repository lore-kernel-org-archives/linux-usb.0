Return-Path: <SRS0=yvD0=3D=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 061C8C33CB3
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jan 2020 12:19:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C689324672
	for <linux-usb@archiver.kernel.org>; Tue, 14 Jan 2020 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579004341;
	bh=vWTsIebNaYX6NTJlgNH63C+3WVnQJwm7AuT/hv4kC4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=riSbHQgChPJ//MA9OJMTULhNsy7kXCeHB13auY79/DAjojBskIgmBulDWkWoA1lZG
	 Njgri7V7PJewvsKjYOY1lV9qny4p2xWpuX2e+IaQl5KdcvfLG5MNaogjaVlURqn+oD
	 0Fnq0PUkT+D2YLzaT1jZGQNLfdYZQO138mp+9QfI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgANMTB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 14 Jan 2020 07:19:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:39986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbgANMTA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 07:19:00 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2BF52465A;
        Tue, 14 Jan 2020 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579004340;
        bh=vWTsIebNaYX6NTJlgNH63C+3WVnQJwm7AuT/hv4kC4o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FOWf3y7KFALW7cPYkvzKZz1XHfkZFf/0cvz6L61nS8LLn7IBChyqxKqHIyo1UDU5L
         VUZxCcEeaOEh0yqXsCf2igYqsXLHS0rF/i/YfFOzEzbusm6BBrXlt3WKOVq252TEsx
         yu01JP+Qa/ttAQl+0Fo8hBUfla9bw2vuTZY50Cc0=
Date:   Tue, 14 Jan 2020 13:18:57 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, stable <stable@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] USB: serial: opticon: stop all I/O on close()
Message-ID: <20200114121857.GB1503960@kroah.com>
References: <20200114110146.5929-1-johan@kernel.org>
 <20200114110146.5929-2-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114110146.5929-2-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 14, 2020 at 12:01:46PM +0100, Johan Hovold wrote:
> Make sure to stop any submitted write URBs on close(). This specifically
> avoids a NULL-pointer dereference or use-after-free in case of a late
> completion event after driver unbind.
> 
> Fixes: 648d4e16567e ("USB: serial: opticon: add write support")
> Cc: stable <stable@vger.kernel.org>	# 2.6.30: xxx: USB: serial: opticon: add chars_in_buffer() implementation
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

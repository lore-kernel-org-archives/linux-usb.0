Return-Path: <SRS0=vzMr=SX=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61547C10F14
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2346F20859
	for <linux-usb@archiver.kernel.org>; Sun, 21 Apr 2019 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1555849578;
	bh=cIHKZ90UhTOeg10qLvFieitIVpgTWdBUw02I5i3ny/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=n2ZGIbUlBE20OFjKj/3FTbun+IMSUD3ismeRcgCXQwAEr1coc6AgHq+9GKz3klmXS
	 G+0TmyZhFEm/lxkab6UnXCUZEWn1nWmrn0wq7eQzVBX7vX6BrIO6UX6x44RRyPimcx
	 PXinaWl8/OA8BSHnfTLAgK0IXmwxzccFj2m+gP+Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727232AbfDUM0R (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 21 Apr 2019 08:26:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45533 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbfDUM0R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Apr 2019 08:26:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id y6so8160223ljd.12
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2019 05:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4+9JT2dIMMGdQyfn3kA47QSiSlsXfI1FioVAEvQPIDU=;
        b=b+ck0uxRlXjV68fxLr6KonDxnpItxnxlEkwVqKA3B3Fk9fFCPsfNaK7vTAM3ESeXOi
         CUYOxQ4L0eeY5TNAcjMdf1xMjpjuBM7v+eZPx9DzX3m7H/RtyQuwQRi7YXGYhWmyIRQt
         VF4kjqvV/DIlBxYmOF0BWXV4di4rNqtfRJwa6XLdRMuMyedmD6my9c/owJid1Al45fMh
         JDaJxGbgi0CHLRlDvu70s6Q3XSwBakJYAjHWujbGbVmtbITyx406U67LhfzJI0BnaAPZ
         kp/5LIB6VD/ivUynwDmGxNZTipU2bRLNS9Mxx6mcBl0EjNRx9R0GnyTkQzpVa3S6xzIA
         WyUA==
X-Gm-Message-State: APjAAAW6fMNTE615UpDKOs1BNsZVhLoM773SwuBUwJDzMDCRH04P5fh2
        cxrxMUfRi+08CeKpwomHqG8=
X-Google-Smtp-Source: APXvYqyZwKmI5GrAz5bas+D/7gwub7C+nNBEdqIwaA6bQ4l5CTbYwQoURKBwf6YKGHWC8209EVyaZg==
X-Received: by 2002:a2e:8616:: with SMTP id a22mr7408069lji.173.1555849575047;
        Sun, 21 Apr 2019 05:26:15 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id a26sm2418235lfo.3.2019.04.21.05.26.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Apr 2019 05:26:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.91)
        (envelope-from <johan@kernel.org>)
        id 1hIBY3-0008Sb-KP; Sun, 21 Apr 2019 14:26:19 +0200
Date:   Sun, 21 Apr 2019 14:26:19 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: serial: digi_acceleport: clean up set_termios
Message-ID: <20190421122619.GE28269@localhost>
References: <20190418162020.23566-1-johan@kernel.org>
 <20190418162020.23566-2-johan@kernel.org>
 <20190419082743.GB28648@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <20190419082743.GB28648@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190421122619.PF5lQNGvFXMA8YSco90LSKxPVWsKoHO_LZ-tjo_-2t8@z>

On Fri, Apr 19, 2019 at 10:27:43AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Apr 18, 2019 at 06:20:20PM +0200, Johan Hovold wrote:
> > Clean up set_termios() by adding missing white space around operators
> > and making a couple of continuation lines more readable.
> > 
> > Also drop a couple of redundant braces.
> > 
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing. Both now applied.

Johan

Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C9DC282DA
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 22:11:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 877C920693
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 22:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KkYUGuqe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbfDQWLD (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 18:11:03 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44618 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbfDQWLD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 18:11:03 -0400
Received: by mail-ed1-f66.google.com with SMTP id i13so103937edf.11
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6kSf7XOwQlNrzig1/4ehRsu9PsSj4C1r+GPIgvRWrD8=;
        b=KkYUGuqeH7GJDvfF0XHzmfEctKO/28DX3dlsdOdsqfMeIQwiVkRZtNzc+MWSnSLm75
         mTrb28dLnfZirANnZwkfGdWF/O9+S0FPRAADA8Rf63czKu1gzYl8UYiAhTeQ1pWgVYQc
         4yqAnz6IE6bJkHKy4Q2BsILZ3Ma4KT6kdZ1BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6kSf7XOwQlNrzig1/4ehRsu9PsSj4C1r+GPIgvRWrD8=;
        b=eMVrA5mkci3u6CXRaoRx6hOBNVGtF0/UzS/9CahKLEjtl8Gavsw8NQv+0DFOotka3k
         ZITuvW/7q+TGwoqJ71ObGsk7BA7FYJkejy4y1efELJoIZwTzjM37mItVCJ8VVulyliI7
         FrCoxUlPkZuB7976R/YVLmQ2drzTk/r3UngbIcQtIeCtnUD13jyxZo8PnGuTZNHpLuY1
         uch6Xie0Jvtha/dMTHecLVIACmx7Q7p5ojGpnmuBU2abz/T3R3HRiCotCQPXccgerEpt
         15RJMP5OOEXFKd+ZUq3klk2fDhDhhqgTa5XfV3lXvy9HtEXhPoWx1voTFvrx4GDen6Bg
         +BOA==
X-Gm-Message-State: APjAAAW3nHXjmLFcpxn54JLFgAJg/rv88xkHh4iZ9KeMc112VuHGLo0I
        6CvxA+7ntYl53K3ynOZOhOJXERYvIkg=
X-Google-Smtp-Source: APXvYqztdX4qpgvP/+EwoqmhmFXE0kqfxdM00kgF/Si+QRobANDssRvA//sGUI/k8ouF1aUJDNET+Q==
X-Received: by 2002:a50:a97a:: with SMTP id m55mr15913838edc.171.1555539061647;
        Wed, 17 Apr 2019 15:11:01 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id g3sm20277ejp.31.2019.04.17.15.10.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 15:11:00 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id y197so458475wmd.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2019 15:10:59 -0700 (PDT)
X-Received: by 2002:a05:600c:28b:: with SMTP id 11mr508929wmk.153.1555539059258;
 Wed, 17 Apr 2019 15:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190417202017.GA204974@google.com> <Pine.LNX.4.44L0.1904171635460.1400-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904171635460.1400-100000@iolanthe.rowland.org>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 17 Apr 2019 16:10:47 -0600
X-Gmail-Original-Message-ID: <CAHQZ30B3+gzuw0=tofwW3yUwJ_MkN6GWPgVg0Qq_6S2tJHkcFQ@mail.gmail.com>
Message-ID:
 <CAHQZ30B3+gzuw0=tofwW3yUwJ_MkN6GWPgVg0Qq_6S2tJHkcFQ@mail.gmail.com>
Subject: Re: [PATCH v3] usb/hcd: Send a uevent signaling that the host
 controller had died
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Guenter Roeck <groeck@chromium.org>,
        oneukum@suse.com, Daniel Kurtz <djkurtz@chromium.org>,
        zwisler@chromium.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dmitry Torokhov <dtor@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Raul Rangel <rrangel@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417221047.xQLw6ZC7jBfUTv6M2NDo2EyJVcFW-4TBVVWR7AFxnLY@z>

On Wed, Apr 17, 2019 at 04:39:23PM -0400, Alan Stern wrote:
>
> This sounds like a golden opportunity!  Submit a separate patch making
> the parameter to kobject_uevent_env be const (actually const char *
> const []), then submit this patch on top of that one.
So there are other parts of the code base that dynamically create their
array values. So by making the function take const, it breaks :(
>
> Alan Stern
>

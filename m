Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C03BBFB6
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788107090; cv=none; b=uKFcNi92XgusHmI5H+x3c6GO8G+WifX8vdFviKFNprRVDkloeHztP25DUvI0Ys9BAzyeOw1uXPUp45THRGHA7NCh85gbMGGNfqA11sfthPHq0qs8BNA6kiGMSF0bb9bhWB9JvZjdrmv4fXK5iIpdddOKJEdkV37/D9SVyXX15RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788107090; c=relaxed/simple;
	bh=wd4/Np9BcKgCQVe8dzA/j4ReDI2xnURtUc5ruSckYZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCQGebpRcBpP62PDfmkiQ6g158CB/W/Yuxr1DUwUVSsCYFcaHFsm+IzDKpDu7RilD+x5rtTkLk0JAlP2vY7sCeqynRf5XOc/858OaZjoW/8OwsWYGEZV/g75G0YqFwZXYaHc0Az47W1RAcz37v4ech9vSifa2pFZk4SWXMpxHQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0zqLHRP; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0zqLHRP"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so755684a91.1
        for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 09:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788107088; x=1788711888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uoOcHIFQQdBWhdhIIcmPfZrkUN2MX77IqhljKCPDFs=;
        b=Q0zqLHRPkU/cKQ2pboJU+wNDp9U9QRIfbF1N+vrdYwdw09KvpxCxldeakOZakYUevd
         C2rQMt2P0f5PdDEnVqURuBGCqG2EN7+HCEIndGVUJ4V65XTpA1Ziys4DIC2VoLya4ULy
         lgTxMTJQropDd1f1F8G5oF7w4TFzwPgwPQfjGVIHH0OYNinUQc4ugARsLVqVOooS3P/3
         Ec4MJY/RF86dU2i3fmnP33P9+U5JehNQ+9lebyA8rU+gt4OBYvG8UPs1ErTcZZXJ0mR3
         3j5N5+Q4E4x7E0+Bq1bLopgZSQqW8X3yRcN3gPJ6FXZfYF8eGQjE50AIP2HiQTJtGLKF
         ty3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788107088; x=1788711888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uoOcHIFQQdBWhdhIIcmPfZrkUN2MX77IqhljKCPDFs=;
        b=UGb0NBnDPuxWcUVWCM8zqFayiB5tcGfVEXzCBmM5aYxYhlrua1Ykee1flH1SYUZebS
         Bi4XBnffATTTQ19E6pSK7RMerKIdLJvj9v2MJeLgEn+Dirwf7Qhk6Snys6jp1y8YxUR7
         rI/edomEtwZ2uTOoLt7q2nWRVBe7j5JlKeX+aBMsoh3QvMfNioX0cyzGzJHak8kIUXcS
         Bcwg1DPyN9Gz3XmHTtls/fdrKCbR7Mj3tF4sPT6otIrAex8/JXdy2U2NIpe+21nwwsO+
         2VsN3SukQUxwKGVXzrh9Vhk5XN9owHjI7fQrkMhrZ6p5S8eBqsThoGOEs/8k1rs6Y9QL
         zD6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwCWSmtPAgfZUGtL8c2Q90z5l+hzLlxeT2E424MbzDbarb/ISvSa8cgguyScydXFtWWtxSfuohLQOA=@vger.kernel.org
X-Gm-Message-State: AFuF++lls55riiXAzk4+Vu5tRIoIkQ9MXMGiCB9JwQ9H7MJsGZrCg3J9
	kWVaHKKJIToLRaSqThOmDyKzjqCxRY6ghS/IcDlG6cHC4dolgT6ODDoa
X-Gm-Gg: AYBFou2GBE7kz920tQMy5gGhs1GG1eaCFMNisDkLvmFKDwQzoVeF1xo3SkvhEdsTQkl
	tBPbUhv+Ry5XhuwZVs4T3U+TrPBF6Rg8PLhSMGrNUmd/IfpDBjGQdioivDmsTCBl2Csk5fLq+V2
	R1IKx1X6sUUaYt2vi110cZ4mqm7mKyvAsJaDRQrIox21iOkRD0CfZw7HdjfJtVIoeDpeBq7WtML
	kLvDmyxRSlItY7UsDkHk4bn7NuKBlecgK8l5Yx3mS6JWlXpQ+PVMsGijYxC+pYesXtV7Tcz0gof
	OWSYVd+jayAnY4reOUBSpCdJcge3We6p08onMcQY57KUw7tABE3nf0+BdGEsqkoIH+g8qqiT1ER
	eTwJEqvEl+06tzTzbdrlaFAxsxb22sH06549GV3/c4q0J+h+zOKU9Dm/tvreKDpHGgRhf50ksOq
	MbKA20sDSeoxFGOYEngyZUqfKMt4YnJtZazA69IGxv3fgwPC7S8eHNsHlMBtktcYRJVg==
X-Received: by 2002:a17:90a:38a3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-398d6e8ffbamr3534533a91.9.1788107088286;
        Sun, 30 Aug 2026 09:24:48 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:fcb:65b0:addd:e3f8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e907fsm21087126eec.25.2026.08.30.09.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:24:47 -0700 (PDT)
Date: Sun, 30 Aug 2026 21:54:19 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: syzbot <syzbot+b197a0fb4e741cc5030e@syzkaller.appspotmail.com>
Cc: davem@davemloft.net, david@ixit.cz, edumazet@google.com,
	horms@kernel.org, krzk@kernel.org, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
	pabeni@redhat.com, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] [nfc?] [net?] memory leak in nci_send_cmd
Message-ID: <apRZM5ZkGw7KQq4-@user>
References: <6a942714.4d659fcc.734b4.003a.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a942714.4d659fcc.734b4.003a.GAE@google.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 73ae59e975966d24e32926247ddb45a537ebe184

diff --git a/drivers/nfc/nfcmrvl/usb.c b/drivers/nfc/nfcmrvl/usb.c
index c7f2afe00b93..7a4094797ba4 100644
--- a/drivers/nfc/nfcmrvl/usb.c
+++ b/drivers/nfc/nfcmrvl/usb.c
@@ -224,12 +224,16 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
        unsigned int pipe;
        int err;
 
-       if (!drv_data->bulk_tx_ep)
+       if (!drv_data->bulk_tx_ep) {
+               kfree_skb(skb);
                return -ENODEV;
+       }
 
        urb = usb_alloc_urb(0, GFP_ATOMIC);
-       if (!urb)
+       if (!urb) {
+               kfree_skb(skb);
                return -ENOMEM;
+       }
 
        pipe = usb_sndbulkpipe(drv_data->udev,
                                drv_data->bulk_tx_ep->bEndpointAddress);
@@ -254,6 +258,7 @@ static int nfcmrvl_usb_nci_send(struct nfcmrvl_private *priv,
                                "urb %p submission failed (%d)\n", urb, -err);
                kfree(urb->setup_packet);
                usb_unanchor_urb(urb);
+               kfree_skb(skb);
        } else {
                usb_mark_last_busy(drv_data->udev);
        }


Return-Path: <SRS0=e+xf=S2=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CBCC10F11
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 59C5B2148D
	for <linux-usb@archiver.kernel.org>; Wed, 24 Apr 2019 09:56:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ps+DjKLv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfDXJ4g (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 24 Apr 2019 05:56:36 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:52284 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfDXJ4f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Apr 2019 05:56:35 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3O9nJbf031189;
        Wed, 24 Apr 2019 09:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=t/qU/kN1iAaIhNkzVgYDAUCwZgnrQzUxa/stNV4KGH8=;
 b=ps+DjKLvCNxMD0Fnn1FgB9znFy8c3YyHvE5PTheJYIFZLky4DfnKqfgp6JBzU4z+zWVp
 XxdnL2ngg0o6WWpfgUuAxiaTyOGLx9fR2SA8OdsPOA2DuBrRi8M39zxQ7Livybpqpwst
 ai+hEMbsXymm0CfZkHg2CuWTfxcbvRD56d3V9/2pyAn+0GxV6Hp88IEVKqt+avm6rm0/
 zs1WyyvH74WBb7tWGEydQSAKoUm7AHXGpgUUiJElhf48XXb390OsDiHGTKm44rmQkATG
 E7purpO7RdqUHzEnYCgNPWAn9+AzKy5AaMEA6EAT5eZMpFYUAxND7COvEscSN9fAhZQW 8Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2130.oracle.com with ESMTP id 2ryrxd1g6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Apr 2019 09:56:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3O9sSHx194957;
        Wed, 24 Apr 2019 09:54:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2s0fv3fvhx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Apr 2019 09:54:28 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3O9sOwG020038;
        Wed, 24 Apr 2019 09:54:24 GMT
Received: from mwanda (/105.55.12.114)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 24 Apr 2019 02:54:23 -0700
Date:   Wed, 24 Apr 2019 12:54:14 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Valentina Manea <valentina.manea.m@gmail.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usbip: stub_rx: tidy the indenting in is_clear_halt_cmd()
Message-ID: <20190424095414.GB16664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9236 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=810
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904240083
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9236 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=839 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904240083
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190424095414.O-LTXNu-KU2JDaRK3ptj512vCavuylzc-bM9GO_N0X8@z>

There is an extra space character before the return statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
index 97b09a42a10c..f3230bed18af 100644
--- a/drivers/usb/usbip/stub_rx.c
+++ b/drivers/usb/usbip/stub_rx.c
@@ -17,9 +17,9 @@ static int is_clear_halt_cmd(struct urb *urb)
 
 	req = (struct usb_ctrlrequest *) urb->setup_packet;
 
-	 return (req->bRequest == USB_REQ_CLEAR_FEATURE) &&
-		 (req->bRequestType == USB_RECIP_ENDPOINT) &&
-		 (req->wValue == USB_ENDPOINT_HALT);
+	return (req->bRequest == USB_REQ_CLEAR_FEATURE) &&
+	       (req->bRequestType == USB_RECIP_ENDPOINT) &&
+	       (req->wValue == USB_ENDPOINT_HALT);
 }
 
 static int is_set_interface_cmd(struct urb *urb)

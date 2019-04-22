Return-Path: <SRS0=5Qiu=SY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E11C10F11
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 13:44:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E203220685
	for <linux-usb@archiver.kernel.org>; Mon, 22 Apr 2019 13:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NOC2cA/b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfDVNoA (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 22 Apr 2019 09:44:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:37326 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfDVNoA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Apr 2019 09:44:00 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3MDhwnZ094922;
        Mon, 22 Apr 2019 08:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1555940638;
        bh=3x5wxunlYm5pKtYR40C6n5HRtmgu0uGtgDhAz45YD78=;
        h=Date:From:To:Subject;
        b=NOC2cA/b78Zy1WNFjCIZv+SxWunrOs3XESZAslnQWF+bJHwBC2VpirOV4aubfJ1aV
         DQnmTxzMeWPL5btpZNCISJBHdi4ftdW2SgKQTPvYDcW2mZAN8WmHGoc1X17R/m6bq5
         8ClTHNDiVUU2+Pfz3Xsl9ScHzkvaqgSQlAMd1NQ0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3MDhwhM076937
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 22 Apr 2019 08:43:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 22
 Apr 2019 08:43:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 22 Apr 2019 08:43:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3MDhvsq006817;
        Mon, 22 Apr 2019 08:43:57 -0500
Date:   Mon, 22 Apr 2019 08:43:57 -0500
From:   Bin Liu <b-liu@ti.com>
To:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
Subject: configfs on dwc3: msc enum failed if three functions defined
Message-ID: <20190422134357.GA2071@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Felipe,

I am having an issue with dwc3 on TI AM57x device, and would like to ask
for your comments.

I use configfs to create a multi-function gadget on dwc3, mass_storage
is the last function, it seems if I create 3 functions, the mass_storage
enumeration will fail on the host. It works fine if only create 2
functions.

The dwc3 tracepoints log shows after all the ep0 transfers for
mass_storage, the very first epXin transfer is not complete - dwc3
programmed the urb, but never generates RX completion event. This also
matches the bus analyzer trace - dwc3 NAKs the very first IN token for
ever.

I use the attached script to create the gadget, The macro FUNCS in the
beginning of the script defines the functions to be created.

Any comments are appreciated.

-Bin.

--6TrnltStXW4iwmi0
Content-Type: application/x-sh
Content-Disposition: attachment; filename="usbconfigfs.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/bash=0A# $1: -d - tear down=0A=0A#FUNCS=3D("acm.usb0" "ncm.usb0" "ac=
m.usb1")=0A#FUNCS=3D("mass_storage.usb0")=0A#FUNCS=3D("hid.usb0")=0AFUNCS=
=3D("uvc.usb0")=0A#FUNCS=3D("uvc.usb0" "hid.usb0")=0A#FUNCS=3D("SourceSink.=
usb0")=0A=0AFUNCS=3D("rndis.usb0" "ecm.usb0" "mass_storage.usb0")=0AFUNCS=
=3D("acm.usb0" "ecm.usb0" "mass_storage.usb0")=0AFUNCS=3D("ecm.usb0" "ncm.u=
sb0" "mass_storage.usb0")=0A=0ACFS=3D/sys/kernel/config/usb_gadget=0AVID=3D=
"0x1d6d"=0APID=3D"0x0104"=0ALANG=3D"0x409"=0A=0ARNDIS_DEV_ADDR=3D"12:22:33:=
44:55:66"=0ARNDIS_HOST_ADDR=3D"12:22:33:44:55:65"=0AECM_DEV_ADDR=3D"12:22:3=
3:44:55:68"=0AECM_HOST_ADDR=3D"12:22:33:44:55:67"=0A=0Ahid_report=3D"\\x05\=
\x01\\x09\\x06\\xa1\\x01\\x05\\x07\\x19\\xe0\\x29\\xe7\\x15\\x00\\x25\\x01\=
\x75\\x01\\x95\\x08\\x81\\x02\\x95\\x01\\x75\\x08\\x81\\x03\\x95\\x05\\x75\=
\x01\\x05\\x08\\x19\\x01\\x29\\x05\\x91\\x02\\x95\\x01\\x75\\x03\\x91\\x03\=
\x95\\x06\\x75\\x08\\x15\\x00\\x25\\x65\\x05\\x07\\x19\\x00\\x29\\x65\\x81\=
\x00\\xc0"=0A=0A=0A=0Ainit()=0A{=0A	zcat /proc/config.gz | grep 'CONFIGFS_F=
S=3D' > /dev/null || exit 1=0A	lsmod | grep libcomposite > /dev/null || mod=
probe libcomposite || exit 2=0A	mount | grep configfs > /devnull || =0A		mo=
unt -t configfs none $(dirname $CFS) || exit 3=0A}=0A=0Acreate_gadget()=0A{=
=0A	[ ! -d ${CFS}/g1 ] || exit 5=0A	mkdir ${CFS}/g1 && cd ${CFS}/g1 || exit=
 6=0A	echo "$VID" > idVendor=0A	echo "$PID" > idProduct=0A=0A	mkdir strings=
/$LANG=0A	echo "0123456789" > strings/$LANG/serialnumber=0A	echo "Foo Inc" =
> strings/$LANG/manufacturer=0A	echo "Bar gadget" > strings/$LANG/product=
=0A}=0A=0A# configuraton naming: configs/<name>.<number>=0Acreate_config()=
=0A{=0A	[ -d ${CFS}/g1 ] && cd ${CFS}/g1 || exit 5=0A	mkdir configs/c.1=0A	=
mkdir configs/c.1/strings/$LANG=0A	echo "conf1" > configs/c.1/strings/$LANG=
/configuration=0A}=0A=0A# $1 - function name=0A# function naming: functions=
/<name>.<instance_name>=0Acreate_func_single()=0A{=0A	local _func=3D$1=0A=
=0A	mkdir functions/${_func} || return=0A	case $_func in=0A	"mass_storage."=
*)=0A 		[ -f /dev/shm/gmsc.file ] || =0A			dd if=3D/dev/zero of=3D/dev/shm/=
gmsc.file bs=3D1M count=3D32=0A		echo /dev/shm/gmsc.file > functions/${_fun=
c}/lun.0/file=0A		;;=0A	"hid."*)=0A		echo 1 > functions/${_func}/protocol=
=0A		echo 1 > functions/${_func}/subclass=0A		echo 8 > functions/${_func}/r=
eport_length=0A		echo -ne $hid_report > functions/${_func}/report_desc=0A		=
;;=0A	"uvc."*)=0A		mkdir functions/${_func}/control/header/h=0A		cd functio=
ns/${_func}/control=0A		ln -s header/h class/fs=0A		ln -s header/h class/ss=
=0A		cd ${CFS}/g1=0A=0A		_w=3D640=0A		_h=3D360=0A		_fps=3D30=0A=0A		mkdir -=
p functions/${_func}/streaming/uncompressed/u/${_h}p=0A		cd functions/${_fu=
nc}/streaming/uncompressed/u/${_h}p=0A		echo $_w > wWidth=0A		echo $_h > wH=
eight=0A		echo $((_h * _w * 2 * _fps)) > dwMaxBitRate=0A		echo $((_h * _w *=
 2 * _fps)) > dwMinBitRate=0A		echo $((_h * _w * 2)) > dwMaxVideoFrameBuffe=
rSize=0A		echo 333333 > dwFrameInterval=0A		echo 333333 > dwDefaultFrameInt=
erval=0A#666666=0A#1000000=0A#5000000=0A		cd ${CFS}/g1=0A		mkdir functions/=
${_func}/streaming/header/h=0A		cd functions/${_func}/streaming/header/h=0A=
		ln -s ../../uncompressed/u=0A		cd ../../class/fs=0A		ln -s ../../header/h=
=0A		cd ../../class/hs=0A		ln -s ../../header/h=0A		cd ../../class/ss=0A		l=
n -s ../../header/h=0A		cd ${CFS}/g1=0A=0A		echo 1024 > functions/${_func}/=
streaming_maxpacket=0A		;;=0A	"rndis."*)=0A#		echo $RNDIS_HOST_ADDR > funct=
ions/${_func}/host_addr=0A#		echo $RNDIS_DEV_ADDR > functions/${_func}/dev_=
addr=0A=0A		# match MS built-in RNDIS driver=0A		echo EF > functions/${_fun=
c}/class=0A		echo 04 > functions/${_func}/subclass=0A		echo 01 > functions/=
${_func}/protocol=0A		;;=0A	"ecm."*)=0A#		echo $ECM_HOST_ADDR > functions/$=
{_func}/host_addr=0A#		echo $ECM_DEV_ADDR > functions/${_func}/dev_addr=0A	=
	;;=0A	esac=0A	ln -s functions/${_func} configs/c.1=0A}=0A=0Aactivate()=0A{=
=0A	local _udc=0A=0A	_udc=3D$(ls /sys/class/udc/)=0A	# TODO check $_udc=0A	=
echo "$_udc" > UDC=0A}=0A=0Ateardown()=0A{=0A	# TODO: test hid & uvc=0A	loc=
al _ent=0A=0A	[ -d ${CFS}/g1 ] && cd ${CFS}/g1 || exit 5=0A	echo "" > UDC=
=0A	for _ent in $(ls configs/c.1/); do=0A		[[ "$_ent" !=3D "MaxPower" ]] ||=
 continue=0A		[[ "$_ent" !=3D "bmAttributes" ]] || continue=0A		[[ "$_ent" =
!=3D "strings" ]] || continue=0A		=0A		rm -f configs/c.1/$_ent=0A	done=0A=
=0A	for _ent in $(ls functions/); do=0A		case $_ent in=0A		"uvc."*)=0A			rm=
 -rf functions/$_ent/streaming 2>/dev/null=0A			;;=0A		esac=0A=0A		rm -rf f=
unctions/$_ent 2>/dev/null=0A	done=0A=0A	rmdir configs/c.1/strings/$LANG=0A=
	rmdir configs/c.1=0A	rmdir strings/$LANG=0A	cd .. && rmdir g1=0A	echo "tor=
edown"=0A}=0A=0A### MAIN ###=0A=0A[ "$1" !=3D "-d" ] || { teardown; exit 0;=
 }=0A=0Ainit=0Acreate_gadget=0Acreate_config=0Afor func in ${FUNCS[*]}; do=
=0A	echo "creating $func ..."=0A	create_func_single $func=0Adone=0Aactivate=
=0Aecho created=0A=0A
--6TrnltStXW4iwmi0--
